part of '../sign_in_screen.dart';

class _SignInWithGoogleButton extends StatelessWidget {
  const _SignInWithGoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listenWhen: (previous, current) => (current.isSuccess) && (current.isSignInWithGoogleWorking),
      buildWhen: (previous, current) =>
          (previous.status != current.status) && (current.isSignInWithGoogleWorking),
      listener: (context, state) => Navigator.push(context, HomeScreen.route()),
      builder: (_, state) => Column(
        children: [
          if (state.isFailure)
            Text(
              state.error!.message,
              style: Theme.of(context).textTheme.bodyText2?.apply(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          RoundedButton(
            child: Text(
              'SIGN IN WITH GOOGLE',
              style: Theme.of(context).textTheme.button?.apply(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            showLoading: state.isInProgress,
            onPressed: () {
              FocusScope.of(context).unfocus();
              context.read<SignInBloc>().onSignInWithGoogle();
            },
          ),
        ],
      ),
    );
  }
}
