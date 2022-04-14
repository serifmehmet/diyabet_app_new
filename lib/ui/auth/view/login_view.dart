import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../core/init/theme/app_theme.dart';
import '../../../core/theme_widgets/button/app_button.dart';
import '../../../core/theme_widgets/input/carbapp_password_text_input.dart';
import '../../../core/theme_widgets/input/carbapp_text_input.dart';
import '../cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
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
                ),
                const SizedBox(height: 40),
                Text("Şifre", style: Theme.of(context).textTheme.inputLabel),
                const SizedBox(height: 9),
                CarbAppPasswordTextInput(
                  inputIcon: IconlyLight.lock,
                  iconSize: 24,
                  iconColor: const Color(0xff130F26),
                  inputTextStyle: Theme.of(context).textTheme.headline4,
                  inputBorderRadius: 15,
                ),
                const SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      NavigationService.instance.navigateToPage(path: NavigationConstants.FORGOT_PASSWORD);
                    },
                    child: Text(
                      "Şifremi Unuttum",
                      style: Theme.of(context).textTheme.orangeForgotPasswordText,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).logIn();
                    NavigationService.instance.navigateToPageClear(path: NavigationConstants.HOME_PAGE);
                  },
                  child: const Center(
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
                      onPressed: () {
                        NavigationService.instance.navigateToPage(path: NavigationConstants.REGISTER);
                      },
                      child: const Text(
                        "Kayıt Ol",
                        style: TextStyle(
                          color: Color(0xFFD6578A),
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
