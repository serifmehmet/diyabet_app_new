import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/core/theme_widgets/button/app_button.dart';
import 'package:diyabet_app/core/theme_widgets/input/app_text_input.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: context.height,
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: context.paddingNormal,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const AppTextInput(
                    hintText: "E-Posta",
                  ),
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
            )),
      ),
    );
  }
}
