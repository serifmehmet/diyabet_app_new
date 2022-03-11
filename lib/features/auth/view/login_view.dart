import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/core/theme_widgets/button/app_button.dart';
import 'package:diyabet_app/core/theme_widgets/input/carbapp_text_input.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: context.paddingMedium,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "CARBAPP",
                    style: Theme.of(context).textTheme.textLogo,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "Giriş Yap",
                  style: Theme.of(context).textTheme.loginHeader,
                ),
                const SizedBox(height: 40),
                Text("E-Posta", style: Theme.of(context).textTheme.inputLabel),
                const SizedBox(height: 9),
                CarbAppTextInput(
                  inputIcon: IconlyLight.message,
                  iconSize: 24,
                  iconColor: const Color(0xff130F26),
                  inputTextStyle: Theme.of(context).textTheme.headline4,
                  inputBorderRadius: 15,
                  isPassword: false,
                ),
                const SizedBox(height: 40),
                Text("Şifre", style: Theme.of(context).textTheme.inputLabel),
                const SizedBox(height: 9),
                CarbAppTextInput(
                  inputIcon: IconlyLight.lock,
                  iconSize: 24,
                  iconColor: const Color(0xff130F26),
                  inputTextStyle: Theme.of(context).textTheme.headline4,
                  inputBorderRadius: 15,
                  suffixIcon: IconlyLight.show,
                  suffixIconColor: const Color(0xff130F26),
                  suffixIconSize: 24,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Şifremi Unuttum",
                      style: Theme.of(context).textTheme.orangeForgotPasswordText,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Center(
                    child: Text("Giriş Yap"),
                  ),
                  style: ElevatedButton.styleFrom(elevation: 0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Hesabın yok mu?",
                      style: TextStyle(
                        color: Color(0xFF7c7c7c),
                        fontFamily: "Signika",
                        fontSize: 17,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Kayıt Ol",
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