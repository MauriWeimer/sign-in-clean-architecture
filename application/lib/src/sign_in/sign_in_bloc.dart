import 'package:application_core/application_core.dart';
import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';

part 'sign_in_state.dart';

class SignInBloc extends Cubit<SignInState> {
  SignInBloc({required SignInWithGoogle signInWithGoogle})
      : _signInWithGoogle = signInWithGoogle,
        super(const SignInState());

  final SignInWithGoogle _signInWithGoogle;

  void onEmailChanged(String email) => emit(state.copyWith(email: email));
  void onPasswordChanged(String password) => emit(state.copyWith(password: password));

  void onSignIn() {
    awaitUseCase(
      stateOnLoading: state.copyWith(currentWorking: CurrentWorking.signIn),
      useCase: Future.delayed(Duration(seconds: 2)),
      then: (_) => emit(state.copyWith(status: Status.success())),
    );
  }

  void onSignInWithGoogle() {
    awaitUseCase<Result<bool>>(
      stateOnLoading: state.copyWith(currentWorking: CurrentWorking.signInWithGoogle),
      useCase: _signInWithGoogle.execute(),
      then: (result) => result.when(
        success: (loggedIn) {
          if (loggedIn)
            emit(state.copyWith(status: const Status.success()));
          else
            emit(state.copyWith(status: const Status()));
        },
        failure: (error) => emit(state.copyWith(status: Status.failure(error: error))),
      ),
    );
  }
}
