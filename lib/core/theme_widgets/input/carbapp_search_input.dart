import 'package:async/async.dart';
import 'package:flutter/material.dart';

class CarbAppSearchInput extends StatefulWidget {
  final String? inputText;
  final String? labelText;
  final IconData inputIcon;

  final double iconSize;
  final Color iconColor;
  final TextStyle? inputTextStyle;
  final TextStyle? labelTextStyle;
  final double inputBorderRadius;
  final void Function(String value) onChanged;
  const CarbAppSearchInput({
    Key? key,
    this.inputText,
    this.labelText,
    required this.inputIcon,
    required this.iconSize,
    required this.iconColor,
    this.inputTextStyle,
    this.labelTextStyle,
    required this.inputBorderRadius,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CarbAppSearchInput> createState() => _CarbAppSearchInputState();
}

class _CarbAppSearchInputState extends State<CarbAppSearchInput> {
  late CancelableOperation<void> cancelableOperation;
  final _delayTime = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _start();
  }

  void _start() {
    cancelableOperation = CancelableOperation.fromFuture(
      Future.delayed(_delayTime),
      onCancel: () {
        print('Canceled');
      },
    );
  }

  void _onItemChanged(String value) {
    cancelableOperation.cancel();
    _start();
    cancelableOperation.value.whenComplete(() {
      widget.onChanged(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: _onItemChanged,
      style: widget.inputTextStyle,
      autocorrect: false,
      decoration: InputDecoration(
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
          size: widget.iconSize,
          color: widget.iconColor,
        ),
        hintText: widget.inputText,
        hintStyle: widget.inputTextStyle,
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      ),
    );
  }
}
