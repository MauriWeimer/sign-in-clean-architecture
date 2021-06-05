part of './sign_up_form.dart';

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.email.error != current.email.error,
      builder: (_, state) => FilledInput(
        hintText: 'Email',
        prefixIcon: Icons.person,
        errorText: state.email.error?.message,
        onChanged: context.read<SignUpBloc>().onEmailChanged,
      ),
    );
  }
}
