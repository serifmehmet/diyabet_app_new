import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.textOfButton,
    this.onPressed,
    this.textColorOfButton,
    this.isLoading = false,
    this.buttonBackgroundColor,
  }) : super(key: key);

  final String textOfButton;
  final Color? textColorOfButton;
  final Color? buttonBackgroundColor;

  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom().copyWith(
        backgroundColor: buttonBackgroundColor != null
            ? MaterialStateProperty.all(buttonBackgroundColor)
            : MaterialStateProperty.all(
                const Color(0xff578AD6),
              ),
      ),
      child: isLoading
          ? const CircularProgressIndicator()
          : Text(
              textOfButton,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
            ),
    );
  }
}
