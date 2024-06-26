import 'package:core/src/presentation/base_bloc/base_bloc.dart';
import 'package:core/src/presentation/base_bloc/base_navigator/base_navigator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core/src/domain/domain.dart';
import '../screens/base_handle_view.dart';

abstract class BaseBlocWidget<B extends BaseBloc> extends StatelessWidget
    with BaseHandleView {
  BaseBlocWidget({super.key});

  B buildBloc(BaseNavigatorBloc navigatorBloc);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<BaseNavigatorBloc>(
              create: (context) => BaseNavigatorBloc()),
          BlocProvider<B>(
              create: (context) =>
                  buildBloc(BlocProvider.of<BaseNavigatorBloc>(context))
                    ..add(BaseBlocEventInitial()))
        ],
        child: BlocListener<BaseNavigatorBloc, BaseNavigatorState>(
          listener: (pre, next) {
            switch (next) {
              case BaseNavigatorStateIdle():
                break;
              case BaseNavigatorStateShowLoading():
                showLoadingDialog(context);
                break;
              case BaseNavigatorStateHideLoading():
                hideLoadingDialog(context);
                break;
              case BaseNavigatorStateShowError():
                showError(context, next.error);
                break;
              case BaseNavigatorStateCustomize():
                handleScreenNavigator(next.customizeNavigator);
                break;
            }
          },
          child: BlocConsumer<B, BaseBlocState>(
            builder: (BuildContext context, BaseBlocState state) {
              switch (state) {
                case BaseBlocInitial():
                  return initialView(context);
                case BaseBlocStateSuccessful():
                  return successView(context, state.data);
                case BaseBlocLoadFailed():
                  return failedView(context, state.exception);
                case BaseBlocLoadingView():
                  return loadingView(context);
                case BaseBlocStateScreenCustomize():
                  return customizeStateView(context, state.stateScreen);
              }
            },
            listener: (BuildContext context, BaseBlocState state) {},
          ),
        ));
  }

  void handleScreenNavigator(BaseNavigatorStateScreen data) {}

  Widget loadingView(BuildContext context) => Center(
          child: SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(
          strokeWidth: 3,
          color: Theme.of(context).primaryColor,
        ),
      ));

  Widget initialView(BuildContext context) => const SizedBox();

  Widget failedView(BuildContext context, AppException appException) =>
      const Center(child: Text('Loaded failed'));

  Widget successView<D>(BuildContext context, D data) {
    return const SizedBox();
  }

  Widget customizeStateView(
      BuildContext context, BaseBlocStateScreen stateScreen) {
    return const SizedBox();
  }

  void onSubmit(BuildContext context, dynamic data) {
    BlocProvider.of<B>(context).add(BaseBlocEventSubmit(data));
  }

  void onEmitCustomizeEvent(
      BuildContext context, BaseBlocEventScreen eventScreen) {
    BlocProvider.of<B>(context).add(BaseBlocEventCustomize(eventScreen));
  }
}
