part of './sign_up_form.dart';

class _RepeatedPasswordInput extends StatelessWidget {
  const _RepeatedPasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) =>
          previous.repeatedPassword.error != current.repeatedPassword.error,
      builder: (_, state) => FilledInput(
        hintText: 'Repeated password',
        prefixIcon: Icons.lock,
        obscureText: true,
        textInputAction: TextInputAction.done,
        errorText: state.repeatedPassword.error?.message,
        onChanged: context.read<SignUpBloc>().onRepeatedPasswordChanged,
      ),
    );
  }
}
