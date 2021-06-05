import 'package:flutter/material.dart';

class FilledInput extends StatelessWidget {
  const FilledInput({
    Key? key,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.errorText,
    this.textInputAction = TextInputAction.next,
    required this.onChanged,
  }) : super(key: key);

  final String? hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final String? errorText;
  final TextInputAction textInputAction;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = themeData.textTheme;
    final colorScheme = themeData.colorScheme;

    return TextField(
      obscureText: obscureText,
      obscuringCharacter: '\u{25CF}',
      style: textTheme.bodyText2?.apply(color: colorScheme.onSecondary),
      textInputAction: textInputAction,
      decoration: InputDecoration(
        prefixIcon: (prefixIcon == null) ? null : Icon(prefixIcon),
        hintText: hintText,
        hintStyle: textTheme.bodyText2?.apply(
          color: colorScheme.onSecondary.withOpacity(0.5),
        ),
        errorText: errorText,
        fillColor: colorScheme.secondary,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
        ),
      ),
      onChanged: onChanged,
      onEditingComplete: FocusScope.of(context).nextFocus,
    );
  }
}
