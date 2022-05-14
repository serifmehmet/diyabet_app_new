import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CarbAppPasswordTextInput extends StatefulWidget {
  final String? inputText;
  final String? labelText;
  final IconData inputIcon;

  final double iconSize;
  final Color iconColor;
  final TextStyle? inputTextStyle;
  final TextStyle? labelTextStyle;
  final double inputBorderRadius;
  final TextEditingController? textController;

  const CarbAppPasswordTextInput(
      {Key? key,
      this.inputText,
      this.labelText,
      required this.inputIcon,
      required this.iconSize,
      required this.iconColor,
      this.inputTextStyle,
      this.labelTextStyle,
      required this.inputBorderRadius,
      this.textController})
      : super(key: key);

  @override
  State<CarbAppPasswordTextInput> createState() => _CarbAppPasswordTextInputState();
}

class _CarbAppPasswordTextInputState extends State<CarbAppPasswordTextInput> {
  bool? _isPass = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: widget.inputTextStyle,
      obscureText: _isPass!,
      controller: widget.textController,
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
            !_isPass! ? IconlyLight.show : IconlyLight.hide,
            color: const Color(0xff130F26),
            size: 24,
          ),
          onPressed: () {
            setState(() {
              _isPass = !_isPass!;
            });
          },
        ),
      ),
    );
  }
}
