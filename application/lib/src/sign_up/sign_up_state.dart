part of './sign_up_bloc.dart';

class SignUpState extends State<Error> {
  const SignUpState({
    this.email = const Email(),
    this.password = const Password(),
    this.repeatedPassword = const Password(),
    Status<Error> status = const Status(),
  }) : super(status);

  final Email email;
  final Password password;
  final Password repeatedPassword;

  bool get isValid => (email.isValid) && (password.isValid) && (repeatedPassword.isValid);

  @override
  SignUpState copyWith({
    Email? email,
    Password? password,
    Password? repeatedPassword,
    Status<Error>? status,
  }) =>
      SignUpState(
        email: email ?? this.email,
        password: password ?? this.password,
        repeatedPassword: repeatedPassword ?? this.repeatedPassword,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [email, password, repeatedPassword, status];
}
