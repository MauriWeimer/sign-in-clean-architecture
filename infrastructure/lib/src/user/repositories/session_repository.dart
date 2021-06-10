import 'package:domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../datasources/contracts/session_data_source_contract.dart';
import '../../core/core.dart';

class SessionRepository implements SessionRepositoryContract {
  const SessionRepository(this._sessionDataSource);

  final SessionDataSourceContract _sessionDataSource;

  @override
  Future<Result<bool>> signUp(String email, String password) =>
      _sessionDataSource.signUp(email, password).toResult(
            onValue: (_) => true,
            onError: (error) {
              switch (error.runtimeType) {
                case FirebaseAuthException:
                  switch (error.code) {
                    case 'weak-password':
                      return Error.weakPassword;
                    case 'email-already-in-use':
                      return Error.emailAlreadyInUse;
                    default:
                      return Error.unknown;
                  }
                default:
                  return Error.unknown;
              }
            },
          );

  @override
  Future<Result<bool>> signInWithGoogle() => _sessionDataSource.signInWithGoogle().toResult(
        onValue: (contactDTO) => contactDTO != null,
        onError: (error) {
          switch (error.runtimeType) {
            case PlatformException:
              switch (error.code) {
                case GoogleSignIn.kNetworkError:
                  return Error.googleSignInFailed;
                default:
                  return Error.unknown;
              }
            case FirebaseAuthException:
              switch (error.code) {
                case 'email-already-in-use':
                  return Error.emailAlreadyInUse;
                default:
                  return Error.unknown;
              }
            default:
              return Error.unknown;
          }
        },
      );
}
