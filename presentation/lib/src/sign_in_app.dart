import 'package:flutter/material.dart';

import './theme/theme.dart';
import './screens/sign_in/sign_in_screen.dart';

class SignInApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign in App',
      theme: SignInTheme.lightTheme,
      home: const SignInScreen(),
    );
  }
}
