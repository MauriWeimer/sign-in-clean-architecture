part of '../sign_up_screen.dart';

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Create account\n',
        style: Theme.of(context).textTheme.headline4,
        children: [
          TextSpan(
            text: 'Please fill the fields to sign up',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
