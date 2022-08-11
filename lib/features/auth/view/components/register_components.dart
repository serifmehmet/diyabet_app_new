part of '../register_view.dart';

extension SnackBarWidget on RegisterView {
  ScaffoldFeatureController buildSnackBar(BuildContext context, String text) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
