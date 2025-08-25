sealed class Result<T> {}

final class Unit {}

final class Success<T> extends Result<T> {
  final T value;

  Success(this.value);
}

final class Failure<T> extends Result<T> {
  final Exception error;
  final Object? value;

  Failure(this.error, [this.value]);
}

Result<Unit> successOfUnit() => Success(Unit());
