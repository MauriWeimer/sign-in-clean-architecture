part of 'sign_in_bloc.dart';

enum CurrentWorking { signIn, signInWithGoogle }

class SignInState extends State<Error> {
  const SignInState({
    this.email = '',
    this.password = '',
    this.currentWorking,
    Status<Error> status = const Status(),
  }) : super(status);

  final String email;
  final String password;
  final CurrentWorking? currentWorking;

  bool get isSignInWorking => this.currentWorking == CurrentWorking.signIn;
  bool get isSignInWithGoogleWorking => this.currentWorking == CurrentWorking.signInWithGoogle;

  @override
  SignInState copyWith({
    String? email,
    String? password,
    CurrentWorking? currentWorking,
    Status<Error>? status,
  }) =>
      SignInState(
        email: email ?? this.email,
        password: password ?? this.password,
        currentWorking: currentWorking ?? this.currentWorking,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [email, password, currentWorking, status];
}
