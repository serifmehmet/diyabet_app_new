import 'package:dartz/dartz.dart';

import '../../base/error/failure.dart';

abstract class BaseUseCase<T> {
  const BaseUseCase();
}

abstract class UseCase<T, P> extends BaseUseCase<T> {
  const UseCase() : super();

  Future<T> call(P params);
}

abstract class UseCaseWithFailure<T, P> extends BaseUseCase<T> {
  const UseCaseWithFailure() : super();

  Future<Either<Failure, T>> call(P params);
}

class NoParams<T> extends BaseUseCase<T> {
  const NoParams() : super();
}
