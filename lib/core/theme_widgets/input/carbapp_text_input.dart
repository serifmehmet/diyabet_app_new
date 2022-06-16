import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CarbAppTextInput extends StatefulWidget {
  final String? inputText;
  final String? labelText;
  final IconData? inputIcon;

  final double? iconSize;
  final Color? iconColor;
  final TextStyle? inputTextStyle;
  final TextStyle? labelTextStyle;
  final double inputBorderRadius;
  final TextEditingController? textController;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  const CarbAppTextInput({
    Key? key,
    this.inputText,
    this.inputIcon,
    this.iconSize,
    this.iconColor,
    required this.inputTextStyle,
    required this.inputBorderRadius,
    this.labelText,
    this.labelTextStyle,
    this.textController,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
  }) : super(key: key);

  @override
  State<CarbAppTextInput> createState() => _CarbAppTextInputState();
}

class _CarbAppTextInputState extends State<CarbAppTextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: widget.inputTextStyle,
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
        errorStyle: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
        hintText: widget.inputText,
        hintStyle: widget.inputTextStyle,
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      ),
      controller: widget.textController,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      validator: widget.validator,
    );
  }
}
