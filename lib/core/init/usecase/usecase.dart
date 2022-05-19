abstract class BaseUseCase<T> {
  const BaseUseCase();
}

abstract class UseCase<T, P> extends BaseUseCase<T> {
  const UseCase() : super();

  Future<T> call(P params);
}

class NoParams<T> extends BaseUseCase<T> {
  const NoParams() : super();
}
