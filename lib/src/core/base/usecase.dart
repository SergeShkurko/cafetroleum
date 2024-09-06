import 'package:cafetroleum/src/core/base/failure.dart';
import 'package:fpdart/fpdart.dart';

typedef WithFailure<T> = Either<Failure, T>;

typedef TaskWithFailure<T> = TaskEither<Failure, T>;

extension FutureEitherAdapter<T> on TaskWithFailure<T> {
  Future<Either<Failure, T>> get fix async =>
      run().then((r) => r.fold(Left.new, Right.new));
}

abstract interface class UseCaseSync<Type, Params> {
  Type call(Params params);
}

abstract interface class UseCase<Type, Params>
    extends UseCaseSync<Type, Params> {}

abstract interface class UseCaseCached<Type, Params>
    extends UseCase<Type, Params> {
  @override
  Type call(Params params, {bool ignoreCache = false});
}

/// Class to handle when useCase don't need params
class NoParams {
  @override
  bool operator ==(Object other) => other is NoParams;

  @override
  int get hashCode => 0;
}

class IdParams {
  const IdParams(this.id);

  @override
  bool operator ==(Object other) => other is NoParams;

  @override
  int get hashCode => 0;

  final String id;
}
