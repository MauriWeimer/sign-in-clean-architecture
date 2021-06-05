import 'package:flutter/material.dart';

part './colors.dart';
part './text_styles.dart';

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
        textTheme: TextTheme(
          headline4: _headline4,
          subtitle1: _subtitle1,
          bodyText2: _bodyText2,
          button: _button,
          caption: _caption,
        ),
      );
}
