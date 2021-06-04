import 'package:flutter/material.dart';

part './colors.dart';

class SignInTheme {
  static get lightTheme => ThemeData.from(
        colorScheme: ColorScheme(
          primary: _primary,
          primaryVariant: _primaryVariant,
          secondary: _secondary,
          secondaryVariant: _secondaryVariant,
          surface: _surface,
          background: _background,
          error: _error,
          onPrimary: _onPrimary,
          onSecondary: _onSecondary,
          onSurface: _onSurface,
          onBackground: _onBackground,
          onError: _onError,
          brightness: Brightness.light,
        ),
        // textTheme: TextTheme(
        //   headline4: TextStyle(
        //     fontFamily: 'Poppins',
        //     fontSize: 34.0,
        //     fontWeight: FontWeight.bold,
        //     letterSpacing: 0.25,
        //     color: const Color(0xFF7B7B7B),
        //   ),
        //   subtitle1: TextStyle(
        //     fontFamily: 'Poppins',
        //     fontSize: 16.0,
        //     fontWeight: FontWeight.w400,
        //     letterSpacing: 0.15,
        //     color: const Color(0xFF7B7B7B),
        //   ),
        //   bodyText2: TextStyle(
        //     fontFamily: 'Poppins',
        //     fontSize: 14.0,
        //     letterSpacing: 0.25,
        //     color: const Color(0xFF7B7B7B),
        //   ),
        //   button: TextStyle(
        //     fontFamily: 'Poppins',
        //     fontSize: 14.0,
        //     fontWeight: FontWeight.w400,
        //     letterSpacing: 1.25,
        //     color: const Color(0xFF7B7B7B),
        //   ),
        //   caption: TextStyle(
        //     fontFamily: 'Poppins',
        //     fontSize: 12.0,
        //     letterSpacing: 0.4,
        //     color: const Color(0xFF7B7B7B),
        //   ),
        // ),
      );
}
