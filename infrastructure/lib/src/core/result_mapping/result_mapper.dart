import 'dart:async';

import 'package:domain/domain.dart';

extension FutureToResult<T> on Future<T> {
  Future<Result<R>> toResult<R>({
    required FutureOr<R> Function(T) onValue,
    required Error? Function(dynamic e)? onError,
  }) =>
      this.then<Result<R>>(
        (value) async {
          final data = await onValue(value);
          return Result.success(data: data);
        },
        onError: onError,
      );
}
