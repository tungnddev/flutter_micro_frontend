import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core/src/domain/domain.dart';
import 'base_bloc_event.dart';
import 'base_navigator/base_navigator_bloc.dart';

export 'base_bloc_event.dart';

part 'base_bloc_state.dart';

abstract class BaseBloc extends Bloc<BaseBlocEvent, BaseBlocState> {
  BaseNavigatorBloc navigatorBloc;

  BaseBloc(this.navigatorBloc, {BaseBlocState? initialState})
      : super(initialState ?? BaseBlocInitial()) {
    on<BaseBlocEvent>(_onBaseBlocEvent);
  }

  void showLoadingDialog() => navigatorBloc.showLoadingDialog();

  void hideLoadingDialog() => navigatorBloc.hideLoadingDialog();

  void showErrorDialog(AppException error) =>
      navigatorBloc.showErrorDialog(error);

  void navigate<T>(T data) => navigatorBloc.navigate(data);

  void _onBaseBlocEvent(
      BaseBlocEvent event, Emitter<BaseBlocState> emit) async {
    switch (event) {
      case BaseBlocEventInitial():
        await onInitialLoad(emit);
        break;
      case BaseBlocEventSubmit():
        await onSubmit(emit, event.data);
        break;
      case BaseBlocEventCustomize():
        await onEventCustomize(emit, event.eventScreen);
        break;
    }
  }

  Future<void> onInitialLoad(Emitter<BaseBlocState> emit);

  Future<void> onSubmit(Emitter<BaseBlocState> emit, dynamic data) async {}

  Future<void> onEventCustomize(
      Emitter<BaseBlocState> emit, BaseBlocEventScreen event) async {}
}

extension EmitterUI on Emitter<BaseBlocState> {
  void loadingView() => call(BaseBlocLoadingView());

  void failedView(AppException error) => call(BaseBlocLoadFailed(error));

  void successfulView<T>(T data) => call(BaseBlocStateSuccessful<T>(data));

  void customizeState(BaseBlocStateScreen state) =>
      call(BaseBlocStateScreenCustomize(state));
}
