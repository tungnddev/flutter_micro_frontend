import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core/src/domain/domain.dart';

part 'base_navigator_state.dart';

class BaseNavigatorBloc extends Cubit<BaseNavigatorState> {
  BaseNavigatorBloc() : super(BaseNavigatorStateIdle());

  void showLoadingDialog() => emit(BaseNavigatorStateShowLoading());

  void hideLoadingDialog() => emit(BaseNavigatorStateHideLoading());

  void showErrorDialog(AppException error) => emit(BaseNavigatorStateShowError(error));

  void navigate<T>(T data) => emit(BaseNavigatorStateCustomize<T>(data));
}
