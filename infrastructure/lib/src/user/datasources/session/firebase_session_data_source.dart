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
  Future<void> signUp(String email, String password) =>
      _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

  @override
  Future<ContactDTO?> signIn(String email, String password) async {
    final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return _getUserFromUserCredential(userCredential);
  }

  @override
  Future<ContactDTO?> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return null;

    final auth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: auth.accessToken,
      idToken: auth.idToken,
    );

    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    return _getUserFromUserCredential(userCredential);
  }

  ContactDTO? _getUserFromUserCredential(UserCredential userCredential) {
    final user = userCredential.user;
    if (user == null) return null;

    return ContactDTO.fromFirebase(user);
  }
}
