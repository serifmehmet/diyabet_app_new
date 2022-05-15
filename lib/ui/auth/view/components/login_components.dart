part of '../login_view.dart';

extension SnackBarWidget on LoginView {
  ScaffoldFeatureController buildSnackBar(BuildContext context, String text) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
