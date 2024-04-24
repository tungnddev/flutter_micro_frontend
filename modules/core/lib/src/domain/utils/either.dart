abstract class Either<L, R> {
  const Either();

  B fold<B>(B Function(L left) ifLeft, B Function(R right) ifRight);

  bool isLeft() => fold((_) => true, (_) => false);

  bool isRight() => fold((_) => false, (_) => true);
}

class Left<L, R> extends Either<L, R> {
  final L _l;

  const Left(this._l);

  L get value => _l;

  @override
  B fold<B>(B Function(L l) ifLeft, B Function(R r) ifRight) => ifLeft(_l);

  @override
  bool operator ==(other) => other is Left && other._l == _l;

  @override
  int get hashCode => _l.hashCode;
}

class Right<L, R> extends Either<L, R> {
  final R _r;

  const Right(this._r);

  R get value => _r;

  @override
  B fold<B>(B Function(L l) ifLeft, B Function(R r) ifRight) => ifRight(_r);

  @override
  bool operator ==(other) => other is Right && other._r == _r;

  @override
  int get hashCode => _r.hashCode;
}
