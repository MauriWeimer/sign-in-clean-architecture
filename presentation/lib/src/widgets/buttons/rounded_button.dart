import 'package:flutter/material.dart';

import '../widgets.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.child,
    this.selected = false,
    this.padding = const EdgeInsets.all(8.0),
    this.showLoading = false,
    required this.onPressed,
  }) : super(key: key);

  final Widget child;
  final bool selected;
  final EdgeInsets padding;
  final bool showLoading;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: IndexedStack(
        index: (showLoading) ? 1 : 0,
        alignment: Alignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: double.infinity),
            child: Center(child: child),
          ),
          if (showLoading) Positioned(top: 0.0, bottom: 0.0, child: LoadingIndicator()),
        ],
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(padding),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
          ),
        ),
        backgroundColor: (!selected)
            ? MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.primary)
            : MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.primaryVariant),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (states) => (states.contains(MaterialState.pressed))
              ? Theme.of(context).colorScheme.primaryVariant
              : null,
        ),
      ),
      onPressed: (showLoading) ? null : onPressed,
    );
  }
}
