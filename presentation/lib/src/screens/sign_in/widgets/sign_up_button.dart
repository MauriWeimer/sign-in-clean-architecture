part of '../sign_in_screen.dart';

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'button',
      child: Column(
        children: [
          Text(
            "Don't have an account?",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(height: 8.0),
          CircularButton(
            child: Icon(
              Icons.expand_more,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () => Navigator.push(context, SignUpScreen.route()),
          ),
        ],
      ),
    );
  }
}
