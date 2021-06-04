part of './sign_in_form.dart';

class _SignInButton extends StatelessWidget {
  const _SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listenWhen: (previous, current) => (current.isSuccess) && (current.isSignInWorking),
      buildWhen: (previous, current) =>
          (previous.status != current.status) && (current.isSignInWorking),
      listener: (context, state) => print('signed in!'),
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
              'LOGIN',
              style: Theme.of(context).textTheme.button?.apply(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            showLoading: state.isInProgress,
            onPressed: () {
              FocusScope.of(context).unfocus();
              context.read<SignInBloc>().onSignIn();
            },
          ),
        ],
      ),
    );
  }
}
