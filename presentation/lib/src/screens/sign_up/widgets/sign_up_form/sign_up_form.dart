import 'package:application/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/widgets.dart';
import '../../../../errors/error_messages.dart';

part './email_input.dart';
part './password_input.dart';
part './repeated_password_input.dart';
part './sign_up_button.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _EmailInput(),
        const SizedBox(height: 24.0),
        const _PasswordInput(),
        const SizedBox(height: 24.0),
        const _RepeatedPasswordInput(),
        const SizedBox(height: 32.0),
        const _SignInButton(),
      ],
    );
  }
}
