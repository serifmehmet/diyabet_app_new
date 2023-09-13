import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../core/init/theme/app_theme.dart';
import '../../../core/theme_widgets/input/carbapp_password_text_input.dart';
import '../../../core/theme_widgets/input/carbapp_text_input.dart';
import '../cubit/cubit/auth_cubit.dart';

part "components/login_components.dart";

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  final formKey = GlobalKey<FormState>();
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
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              buildSnackBar(context, "Kullanıcı adı veya Şifre yanlış.");
            }
          },
          builder: (context, state) {
            if (state is LoginInfoPosting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }

            return buildForm(context, formKey);
          },
        ),
      ),
    );
  }

  Widget buildForm(BuildContext context, GlobalKey<FormState>? key) {
    final focus = FocusScope.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: context.paddingMedium,
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "KARBAPP",
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
                textController: emailController,
                keyboardType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
                focuNode: emailFocus,
                onFieldSubmit: (val) {
                  emailFocus.unfocus();
                  focus.requestFocus(passwordFocus);
                  return null;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'E-Posta adresi boş bırakılamaz';
                  }

                  if (!val.isValidEmail) {
                    return 'E-Posta adresi hatalı';
                  }

                  return null;
                },
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
                textController: passwordController,
                focuNode: passwordFocus,
                onFieldSubmit: (val) {
                  passwordFocus.unfocus();

                  return null;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Şifre alanı boş bırakılmaz";
                  }
                  return null;
                },
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
                  if (key!.currentState!.validate()) {
                    BlocProvider.of<AuthCubit>(context).logIn(
                      emailController.text,
                      passwordController.text,
                    );
                  }

                  // NavigationService.instance.navigateToPageClear(path: NavigationConstants.HOME_PAGE);
                },
                style: ElevatedButton.styleFrom(elevation: 0),
                child: const Center(
                  child: Text("Giriş Yap"),
                ),
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
    );
  }
}
