import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injection/injection.dart';

import './src/sign_in_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Injector.configureDependencies();

  runApp(SignInApp());
}
