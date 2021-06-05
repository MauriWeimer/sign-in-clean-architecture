import 'package:application_core/application_core.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';

part './sign_up_state.dart';

class SignUpBloc extends Cubit<SignUpState> {
  SignUpBloc() : super(const SignUpState());

  void onEmailChanged(String email) => emit(state.copyWith(email: Email.pure(value: email)));

  void onPasswordChanged(String password) => emit(
        state.copyWith(
          password: Password.pure(value: password),
          repeatedPassword: Password.pure(
            value: state.repeatedPassword.value,
            repeated: password,
          ),
        ),
      );

  void onRepeatedPasswordChanged(String password) => emit(
        state.copyWith(
          repeatedPassword: Password.pure(
            value: password,
            repeated: state.password.value,
          ),
        ),
      );

  void onSignUp() {
    final email = state.email.validate();
    final password = state.password.validate();
    final repeatedPassword = state.repeatedPassword.validate();

    if (state.isValid)
      awaitUseCase(
        useCase: Future.delayed(Duration(seconds: 2)),
        then: (_) => emit(state.copyWith(status: Status.success())),
      );
  }
}
