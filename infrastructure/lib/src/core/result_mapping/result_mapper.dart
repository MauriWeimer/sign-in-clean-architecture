import 'dart:async';

import 'package:domain/domain.dart';

extension FutureToResult<T> on Future<T> {
  Future<Result<R>> toResult<R>({
    required FutureOr<R> Function(T) onValue,
    required Error Function(dynamic e) onError,
  }) =>
      this.then<Result<R>>(
        (value) async {
          final data = await onValue(value);
          return Result<R>.success(data: data);
        },
        onError: (e) {
          final error = onError(e);
          return Result<R>.failure(error: error);
        },
      );
}
