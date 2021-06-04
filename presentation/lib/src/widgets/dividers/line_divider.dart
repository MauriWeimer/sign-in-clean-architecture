import 'package:flutter/material.dart';

class LineDivider extends StatelessWidget {
  const LineDivider({
    Key? key,
    required this.text,
    this.padding = EdgeInsets.zero,
    this.expandLines = false,
  }) : super(key: key);

  final String text;
  final EdgeInsets padding;
  final bool expandLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          if (!expandLines) const Spacer(),
          const Expanded(flex: 2, child: const _Line()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              text,
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          const Expanded(flex: 2, child: const _Line()),
          if (!expandLines) const Spacer(),
        ],
      ),
    );
  }
}

class _Line extends StatelessWidget {
  const _Line({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.25,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
      ),
    );
  }
}
