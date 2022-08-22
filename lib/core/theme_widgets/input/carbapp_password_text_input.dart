import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final FocusNode? focuNode;
  final String? Function(String?)? onFieldSubmit;
  final TextInputAction? inputAction;

  const CarbAppPasswordTextInput({
    Key? key,
    this.inputText,
    this.labelText,
    required this.inputIcon,
    required this.iconSize,
    required this.iconColor,
    this.inputTextStyle,
    this.labelTextStyle,
    required this.inputBorderRadius,
    this.textController,
    this.inputFormatters,
    this.validator,
    this.focuNode,
    this.onFieldSubmit,
    this.inputAction,
  }) : super(key: key);

  @override
  State<CarbAppPasswordTextInput> createState() => _CarbAppPasswordTextInputState();
}

class _CarbAppPasswordTextInputState extends State<CarbAppPasswordTextInput> {
  bool? _isPass = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        errorStyle: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w400,
          fontSize: 15,
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
      validator: widget.validator,
      inputFormatters: widget.inputFormatters,
      focusNode: widget.focuNode,
      onFieldSubmitted: widget.onFieldSubmit,
      textInputAction: widget.inputAction,
    );
  }
}
