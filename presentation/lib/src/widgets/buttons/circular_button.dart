import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({Key? key, required this.child, required this.onPressed}) : super(key: key);

  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: child,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(Size.zero),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(12.0)),
        shape: MaterialStateProperty.all<OutlinedBorder>(const CircleBorder()),
        backgroundColor: MaterialStateProperty.all<Color?>(
          Theme.of(context).colorScheme.primary,
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          Theme.of(context).colorScheme.primaryVariant,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
