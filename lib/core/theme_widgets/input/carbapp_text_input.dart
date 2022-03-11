import 'package:flutter/material.dart';

class CarbAppTextInput extends StatefulWidget {
  final String? inputText;
  final String? labelText;
  final IconData inputIcon;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final double? suffixIconSize;
  final double iconSize;
  final Color iconColor;
  final TextStyle? inputTextStyle;
  final TextStyle? labelTextStyle;
  final double inputBorderRadius;
  final bool isPassword;
  const CarbAppTextInput({
    Key? key,
    this.inputText,
    required this.inputIcon,
    required this.iconSize,
    required this.iconColor,
    required this.inputTextStyle,
    required this.inputBorderRadius,
    this.labelText,
    this.labelTextStyle,
    this.suffixIcon,
    this.suffixIconColor,
    this.suffixIconSize,
    required this.isPassword,
  }) : super(key: key);

  @override
  State<CarbAppTextInput> createState() => _CarbAppTextInputState();
}

class _CarbAppTextInputState extends State<CarbAppTextInput> {
  bool? isPass;

  @override
  void initState() {
    isPass = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: widget.inputTextStyle,
      obscureText: isPass!,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: widget.labelTextStyle,
        fillColor: const Color(0xffF4F4F4),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(widget.inputBorderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(widget.inputBorderRadius),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.inputBorderRadius),
        ),
        prefixIcon: Icon(
          widget.inputIcon,
          color: widget.iconColor,
          size: widget.iconSize,
        ),
        hintText: widget.inputText,
        hintStyle: widget.inputTextStyle,
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        suffixIcon: IconButton(
          icon: Icon(
            widget.suffixIcon,
            color: widget.suffixIconColor,
            size: widget.suffixIconSize,
          ),
          onPressed: () {
            setState(() {
              isPass = !isPass!;
            });
          },
        ),
      ),
    );
  }
}
