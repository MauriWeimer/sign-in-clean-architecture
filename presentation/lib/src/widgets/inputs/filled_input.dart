import 'package:flutter/material.dart';

class FilledInput extends StatefulWidget {
  const FilledInput({
    Key? key,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.errorText,
    this.textInputAction = TextInputAction.next,
    required this.onLostFocus,
  }) : super(key: key);

  final String? hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final String? errorText;
  final TextInputAction textInputAction;
  final void Function(String) onLostFocus;

  @override
  _FilledInputState createState() => _FilledInputState();
}

class _FilledInputState extends State<FilledInput> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    final focused = _focusNode.hasFocus;
    if (!focused) widget.onLostFocus(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final textTheme = themeData.textTheme;
    final colorScheme = themeData.colorScheme;

    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      obscureText: widget.obscureText,
      obscuringCharacter: '\u{25CF}',
      style: textTheme.bodyText2?.apply(color: colorScheme.onSecondary),
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        prefixIcon: (widget.prefixIcon == null) ? null : Icon(widget.prefixIcon),
        hintText: widget.hintText,
        hintStyle: textTheme.bodyText2?.apply(
          color: colorScheme.onSecondary.withOpacity(0.5),
        ),
        errorText: widget.errorText,
        fillColor: colorScheme.secondary,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
        ),
      ),
      onEditingComplete: FocusScope.of(context).nextFocus,
    );
  }
}
