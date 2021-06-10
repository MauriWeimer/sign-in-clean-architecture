import 'package:application_core/application_core.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';

part './sign_up_state.dart';

class SignUpBloc extends Cubit<SignUpState> {
  SignUpBloc({required SignUp signUp})
      : _signUp = signUp,
        super(const SignUpState());

  final SignUp _signUp;

  void onEmailChanged(String email) => emit(state.copyWith(email: Email(value: email)));

  void onPasswordChanged(String password) => emit(
        state.copyWith(
          password: Password(value: password),
          repeatedPassword: state.repeatedPassword.copyWith(
            repeated: password,
          ),
        ),
      );

  void onRepeatedPasswordChanged(String password) => emit(
        state.copyWith(
          repeatedPassword: Password(
            value: password,
            repeated: state.password.value,
          ),
        ),
      );

  void onSignUp() {
    // Valido los fields al presionar el boton
    emit(
      state.copyWith(
        email: state.email.validate(),
        password: state.password.validate(),
        repeatedPassword: state.repeatedPassword.validate(),
      ),
    );

    if (state.isValid)
      awaitUseCase<Result<bool>>(
        useCase: _signUp.execute(state.email, state.password),
        then: (result) => result.when(
          success: (signedUp) {
            if (signedUp)
              emit(state.copyWith(status: const Status.success()));
            else
              emit(state.copyWith(status: const Status()));
          },
          failure: (error) => emit(state.copyWith(status: Status.failure(error: error))),
        ),
      );
  }
}
