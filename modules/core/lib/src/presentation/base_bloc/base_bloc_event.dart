sealed class BaseBlocEvent {}

class BaseBlocEventInitial extends BaseBlocEvent {}

class BaseBlocEventSubmit<T> extends BaseBlocEvent {
  T data;

  BaseBlocEventSubmit(this.data);
}

class BaseBlocEventCustomize extends BaseBlocEvent {
  BaseBlocEventScreen eventScreen;

  BaseBlocEventCustomize(this.eventScreen);
}

class BaseBlocEventScreen {}
