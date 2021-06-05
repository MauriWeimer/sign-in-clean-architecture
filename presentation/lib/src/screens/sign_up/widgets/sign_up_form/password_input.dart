part of './sign_up_form.dart';

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.password.error != current.password.error,
      builder: (_, state) => FilledInput(
        hintText: 'Password',
        prefixIcon: Icons.lock,
        obscureText: true,
        errorText: state.password.error?.message,
        onChanged: context.read<SignUpBloc>().onPasswordChanged,
      ),
    );
  }
}
