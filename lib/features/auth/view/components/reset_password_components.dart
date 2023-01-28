part of '../forgot_password_view.dart';

extension SnackBarWidget on ForgotPasswordView {
  ScaffoldFeatureController buildSnackBar(BuildContext context, String text) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
