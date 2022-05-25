import 'dart:async';

import 'package:diyabet_app/core/constants/navigation/navigation_constants.dart';
import 'package:diyabet_app/core/init/navigation/navigation_service.dart';
import 'package:diyabet_app/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/init/theme/app_theme.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    Timer(
      const Duration(seconds: 1),
      () {
        if (authCubit.state is Authenticated) {
          NavigationService.instance.navigateToPageClear(path: NavigationConstants.HOME_PAGE);
        } else if (authCubit.state is UnAuthenticated) {
          NavigationService.instance.navigateToPageClear(path: NavigationConstants.HOME_PAGE);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: context.height,
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: context.paddingNormal,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "CARBAPP",
                style: Theme.of(context).textTheme.logo,
              ),
              SizedBox(height: context.mediaQuery.size.height / 2.5),
              Text(
                "PediDER",
                style: Theme.of(context).textTheme.headline2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
