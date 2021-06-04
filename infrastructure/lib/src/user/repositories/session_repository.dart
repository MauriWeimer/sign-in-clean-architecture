import 'dart:io';

import 'package:domain/domain.dart';

import '../datasources/contracts/session_data_source_contract.dart';
import '../../core/core.dart';

class SessionRepository implements SessionRepositoryContract {
  const SessionRepository(this._sessionDataSource);

  final SessionDataSourceContract _sessionDataSource;

  @override
  Future<Result<bool>> signInWithGoogle() => _sessionDataSource.signInWithGoogle().toResult(
        onValue: (contactDTO) => contactDTO != null,
        onError: (error) {
          // TODO: agregar excepciones de cuenta en uso, etc
          switch (error.runtimeType) {
            case SocketException:
              return Error.network;
            default:
              return Error.googleSignInFailed;
          }
        },
      );
}
