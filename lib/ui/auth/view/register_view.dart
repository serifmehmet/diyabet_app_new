import 'package:diyabet_app/core/constants/navigation/navigation_constants.dart';
import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/navigation/navigation_service.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/core/theme_widgets/input/carbapp_password_text_input.dart';
import 'package:diyabet_app/core/theme_widgets/input/carbapp_text_input.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).backgroundColor,
          actionsIconTheme: const IconThemeData(
            color: Color(0xff000000),
          ),
          iconTheme: const IconThemeData(
            color: Color(0xff000000),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: context.paddingMedium,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "CARBAPP",
                    style: Theme.of(context).textTheme.textLogo,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Kayıt Ol",
                  style: Theme.of(context).textTheme.loginHeader,
                ),
                const SizedBox(height: 30),
                Text("Ad-Soyad", style: Theme.of(context).textTheme.inputLabel),
                const SizedBox(height: 9),
                CarbAppTextInput(
                  inputIcon: IconlyLight.profile,
                  iconSize: 24,
                  iconColor: const Color(0xff130F26),
                  inputTextStyle: Theme.of(context).textTheme.headline4,
                  inputBorderRadius: 15,
                ),
                const SizedBox(height: 15),
                Text("E-Posta", style: Theme.of(context).textTheme.inputLabel),
                const SizedBox(height: 9),
                CarbAppTextInput(
                  inputIcon: IconlyLight.message,
                  iconSize: 24,
                  iconColor: const Color(0xff130F26),
                  inputTextStyle: Theme.of(context).textTheme.headline4,
                  inputBorderRadius: 15,
                ),
                const SizedBox(height: 15),
                Text("Şifre", style: Theme.of(context).textTheme.inputLabel),
                const SizedBox(height: 9),
                CarbAppPasswordTextInput(
                  inputIcon: IconlyLight.lock,
                  iconSize: 24,
                  iconColor: const Color(0xff130F26),
                  inputTextStyle: Theme.of(context).textTheme.headline4,
                  inputBorderRadius: 15,
                ),
                const SizedBox(height: 15),
                Text("Şifre Tekrar", style: Theme.of(context).textTheme.inputLabel),
                const SizedBox(height: 9),
                CarbAppPasswordTextInput(
                  inputIcon: IconlyLight.lock,
                  iconSize: 24,
                  iconColor: const Color(0xff130F26),
                  inputTextStyle: Theme.of(context).textTheme.headline4,
                  inputBorderRadius: 15,
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {},
                  child: Center(
                    child: Text("Kayıt Ol"),
                  ),
                  style: ElevatedButton.styleFrom(elevation: 0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Zaten hesabın var mı?",
                      style: TextStyle(
                        color: Color(0xFF7c7c7c),
                        fontFamily: "Signika",
                        fontSize: 17,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        NavigationService.instance.navigateToPageClear(path: NavigationConstants.LOGIN);
                      },
                      child: const Text(
                        "Giriş Yap",
                        style: TextStyle(
                          color: Color(
                            0xff91C788,
                          ),
                          fontSize: 17,
                          fontFamily: "Signika",
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
