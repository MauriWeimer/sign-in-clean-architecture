part of './sign_up_form.dart';

class _SignInButton extends StatelessWidget {
  const _SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listenWhen: (previous, current) => current.isSuccess,
      buildWhen: (previous, current) => (previous.status != current.status) && (current.isValid),
      listener: (context, state) => Navigator.pop(context),
      builder: (_, state) => Column(
        children: [
          if (state.isFailure)
            Text(
              '${state.error}',
              style: Theme.of(context).textTheme.bodyText2?.apply(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          RoundedButton(
            child: Text(
              'SIGN UP',
              style: Theme.of(context).textTheme.button?.apply(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            showLoading: state.isInProgress,
            onPressed: () {
              FocusScope.of(context).unfocus();
              context.read<SignUpBloc>().onSignUp();
            },
          ),
        ],
      ),
    );
  }
}
