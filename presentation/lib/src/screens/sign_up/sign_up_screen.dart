import 'package:application/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/widgets.dart';
import './widgets/sign_up_form/sign_up_form.dart';

part './widgets/title.dart';
part './widgets/sign_in_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static Route<void> route() => MaterialPageRoute(builder: (_) => const SignUpScreen());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final titlePadding = screenSize.height * 0.075;

    return Scaffold(
      body: GestureDetector(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: screenSize.width,
              minHeight: screenSize.height,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SafeArea(
                  child: BlocProvider<SignUpBloc>(
                    create: (_) => SignUpBloc(),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: titlePadding),
                          child: const _Title(),
                        ),
                        const SignUpForm(),
                        const Spacer(),
                        const _SignInButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        onTap: FocusScope.of(context).unfocus,
      ),
    );
  }
}
