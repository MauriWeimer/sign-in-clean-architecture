part of '../sign_up_screen.dart';

class _SignInButton extends StatelessWidget {
  const _SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularButton(
          child: RotatedBox(
            quarterTurns: 2,
            child: Icon(
              Icons.expand_more,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        const SizedBox(height: 8.0),
        Text(
          'Have an account?',
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
