import '../error/error.dart';

abstract class Result<T> {
  const factory Result.success({required T data}) = SuccessResult<T>;
  const factory Result.failure({required Error error}) = FailureResult<T>;

  void when({
    required void Function(T data) success,
    required void Function(Error error) failure,
  });
}

class SuccessResult<T> implements Result<T> {
  final T data;

  const SuccessResult({required this.data});

  @override
  void when({
    required void Function(T data) success,
    required void Function(Error error) failure,
  }) =>
      success(data);

  @override
  String toString() => '[ SUCCESS ] -> $data';
}

class FailureResult<T> implements Result<T> {
  final Error error;

  const FailureResult({required this.error});

  @override
  void when({
    required void Function(T data) success,
    required void Function(Error error) failure,
  }) =>
      failure(error);

  @override
  String toString() => '[ ERROR ] -> $error';
}
