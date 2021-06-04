import 'package:application/application.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injection/injection.dart';

import './widgets/sign_in_form/sign_in_form.dart';
import '../../widgets/widgets.dart';
import '../../errors/error_messages.dart';
import '../home/home_screen.dart';

part './widgets/title.dart';
part './widgets/sign_in_with_google_button.dart';
part './widgets/sign_up_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

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
                  child: BlocProvider<SignInBloc>(
                    create: (_) => SignInBloc(
                      signInWithGoogle: Injector.getInstance<SignInWithGoogle>(),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: titlePadding),
                          child: const _Title(),
                        ),
                        const SignInForm(),
                        const LineDivider(
                          text: 'OR',
                          padding: const EdgeInsets.symmetric(vertical: 32.0),
                          expandLines: true,
                        ),
                        const _SignInWithGoogleButton(),
                        const Spacer(),
                        const _SignUpButton(),
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
