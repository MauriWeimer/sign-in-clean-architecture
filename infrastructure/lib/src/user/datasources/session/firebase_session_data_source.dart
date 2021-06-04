import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../contracts/session_data_source_contract.dart';
import '../../dtos/contact/contact_dto.dart';

class FirebaseSessionDataSource implements SessionDataSourceContract {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<ContactDTO?> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final auth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: auth.accessToken,
        idToken: auth.idToken,
      );

      return _loginWithCredential(credential);
    } on PlatformException catch (error) {
      // Abstraer al repositorio y devolverle excepciones conocidas por él
      switch (error.code) {
        case GoogleSignIn.kNetworkError:
          throw SocketException('Google sign-in network error');
        default:
          rethrow;
      }
    }
  }

  Future<ContactDTO?> _loginWithCredential(AuthCredential credential) async {
    // TODO: revisar excepciones
    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    final user = userCredential.user;
    if (user == null) return null;

    return ContactDTO.fromFirebase(user);
  }
}
