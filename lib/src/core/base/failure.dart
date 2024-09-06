sealed class Failure {
  const Failure([List<Object?> properties = const []]);
}

class ServerFailure extends Failure {
  final String? message;
  final int? errorCode;

  const ServerFailure([this.message, this.errorCode]);

  @override
  bool operator ==(Object other) =>
      other is ServerFailure && other.message == message;

  @override
  int get hashCode => message.hashCode;
}

class NoDataFailure extends Failure {
  @override
  bool operator ==(Object other) => other is NoDataFailure;

  @override
  int get hashCode => 0;
}

class RefreshTokenExpiredFailure extends Failure {
  @override
  bool operator ==(Object other) => other is SignRequiredFailure;

  @override
  int get hashCode => 0;
}

class SignRequiredFailure extends Failure {
  @override
  bool operator ==(Object other) => other is SignRequiredFailure;

  @override
  int get hashCode => 0;
}

class CacheFailure extends Failure {
  @override
  bool operator ==(Object other) => other is CacheFailure;

  @override
  int get hashCode => 0;
}

class UnexpectedFailure extends Failure {
  final String? message;

  const UnexpectedFailure([this.message]);

  @override
  bool operator ==(Object other) =>
      other is UnexpectedFailure && other.message == message;

  @override
  int get hashCode => message.hashCode;
}

class UnimplementedFailure extends Failure {
  @override
  bool operator ==(Object other) => other is UnexpectedFailure;

  @override
  int get hashCode => 0;
}
