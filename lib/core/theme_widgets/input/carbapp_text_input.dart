import 'package:flutter/material.dart';

class CarbAppTextInput extends StatelessWidget {
  final String inputText;
  final Icon inputIcon;
  final double iconSize;
  final Color iconColor;
  final TextStyle? inputTextStyle;
  final double inputBorderRadius;

  const CarbAppTextInput({
    Key? key,
    required this.inputText,
    required this.inputIcon,
    required this.iconSize,
    required this.iconColor,
    required this.inputTextStyle,
    required this.inputBorderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: inputTextStyle,
      decoration: InputDecoration(
        fillColor: const Color(0xffF4F4F4),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(inputBorderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(inputBorderRadius),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(inputBorderRadius),
        ),
        prefixIcon: inputIcon,
        hintText: inputText,
        hintStyle: inputTextStyle,
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      ),
    );
  }
}
