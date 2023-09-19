import 'dart:async';

import 'package:diyabet_app/core/constants/app_sizes.dart';
import 'package:diyabet_app/core/constants/enums/preferences_keys.dart';
import 'package:diyabet_app/core/init/cache/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../core/init/theme/app_theme.dart';
import '../cubit/cubit/auth_cubit.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    bool isFirstTime = CacheManager.instance.getBoolValue(PreferencesKeys.IS_FIRST_TIME);
    Timer(
      const Duration(seconds: 2),
      () {
        if (authCubit.state is Authenticated) {
          //This is for the first time run
          if (!isFirstTime) {
            CacheManager.instance.setBoolValue(PreferencesKeys.IS_FIRST_TIME, true);
            NavigationService.instance.navigateToPageClear(path: NavigationConstants.ONBOARD);
          } else {
            NavigationService.instance.navigateToPageClear(path: NavigationConstants.HOME_PAGE);
          }
        } else if (authCubit.state is UnAuthenticated) {
          //This is for the first time run
          if (!isFirstTime) {
            CacheManager.instance.setBoolValue(PreferencesKeys.IS_FIRST_TIME, true);
            NavigationService.instance.navigateToPageClear(path: NavigationConstants.ONBOARD);
          } else {
            NavigationService.instance.navigateToPageClear(path: NavigationConstants.HOME_PAGE);
          }
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
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: context.paddingNormal,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "KARBAPP",
                    style: Theme.of(context).textTheme.logo,
                  ),
                ),
              ),
              Image.asset(
                "assets/pedider-logo.png",
                width: 150,
                height: 88,
              ),
              gapH20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/iu-logo.png",
                    width: 75,
                    height: 75,
                  ),
                  gapW16,
                  Image.asset(
                    "assets/ege-uni-logo.png",
                    width: 75,
                    height: 75,
                  ),
                ],
              ),
              gapH64,
            ],
          ),
        ),
      ),
    );
  }
}
