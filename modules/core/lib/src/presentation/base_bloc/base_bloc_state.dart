part of 'base_bloc.dart';

sealed class BaseBlocState {}

class BaseBlocInitial extends BaseBlocState {}

class BaseBlocStateSuccessful<T> extends BaseBlocState {
  T data;

  BaseBlocStateSuccessful(this.data);
}

class BaseBlocLoadFailed extends BaseBlocState {
  AppException exception;

  BaseBlocLoadFailed(this.exception);
}

class BaseBlocLoadingView extends BaseBlocState {}

class BaseBlocStateScreenCustomize extends BaseBlocState {
  BaseBlocStateScreen stateScreen;

  BaseBlocStateScreenCustomize(this.stateScreen);
}

class BaseBlocStateScreen {}
