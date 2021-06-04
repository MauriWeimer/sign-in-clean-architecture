part of '../sign_in_screen.dart';

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Welcome!\n',
        style: Theme.of(context).textTheme.headline4,
        children: [
          TextSpan(
            text: 'Please sign in to continue',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
