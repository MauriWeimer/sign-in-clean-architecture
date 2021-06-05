import 'package:application/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/widgets.dart';

part './sign_in_button.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledInput(
          hintText: 'Email',
          prefixIcon: Icons.person,
          onChanged: context.read<SignInBloc>().onEmailChanged,
        ),
        const SizedBox(height: 24.0),
        FilledInput(
          hintText: 'Password',
          prefixIcon: Icons.lock,
          obscureText: true,
          textInputAction: TextInputAction.done,
          onChanged: context.read<SignInBloc>().onPasswordChanged,
        ),
        const SizedBox(height: 32.0),
        const _SignInButton(),
      ],
    );
  }
}
