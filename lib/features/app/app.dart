import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/features/app/cubit/app_cubit.dart';
import 'package:diyabet_app/features/auth/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/base/error/error_object.dart';
import '../../core/constants/navigation/navigation_constants.dart';
import '../../core/init/navigation/navigation_service.dart';
import '../../core/theme_widgets/dialog/alert_dialogs.dart';

class KarbApp extends StatelessWidget {
  const KarbApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SplashView();
  }
}
