import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String textOfButton;
  final Color? textColorOfButton;

  final ElevatedButtonThemeData? buttonThemeData;
  final VoidCallback? onClick;

  const AppButton({Key? key, required this.textOfButton, this.onClick, this.textColorOfButton, this.buttonThemeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonThemeData!.style,
      onPressed: onClick!,
      child: Text(
        textOfButton,
      ),
    );
  }
}
