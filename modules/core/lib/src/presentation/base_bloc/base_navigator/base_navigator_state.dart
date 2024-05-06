part of 'base_navigator_bloc.dart';

sealed class BaseNavigatorState {}

class BaseNavigatorStateIdle extends BaseNavigatorState {}

class BaseNavigatorStateShowLoading extends BaseNavigatorState {}

class BaseNavigatorStateHideLoading extends BaseNavigatorState {}

class BaseNavigatorStateShowError extends BaseNavigatorState {
  AppException error;

  BaseNavigatorStateShowError(this.error);
}

class BaseNavigatorStateCustomize<BaseNavigatorStateScreen>
    extends BaseNavigatorState {
  BaseNavigatorStateScreen customizeNavigator;

  BaseNavigatorStateCustomize(this.customizeNavigator);
}

class BaseNavigatorStateScreen {}
