import 'package:flutter/material.dart';

const kDialogDefaultKey = Key("dialog-default-key");
Future<bool?> showAlertDialogDefault({
  required BuildContext context,
  required String title,
  Widget? content,
  String? cancelActionText,
  String defaultActionText = 'OK',
  bool? isDissmisableInTime = false,
  int? dissmissSeconds = 0,
}) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      if (isDissmisableInTime!) {
        Future.delayed(Duration(seconds: dissmissSeconds!), () {
          Navigator.of(context).pop(true);
        });
      }

      return AlertDialog(
        title: Text(title),
        content: content,
        actions: [
          if (cancelActionText != null)
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                cancelActionText,
                style: const TextStyle(
                  color: Color(
                    0xff000000,
                  ),
                ),
              ),
            ),
          TextButton(
            child: Text(
              defaultActionText,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      );
    },
  );
}
