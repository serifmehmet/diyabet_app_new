import 'package:diyabet_app/core/constants/navigation/navigation_constants.dart';
import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/extensions/string_extension.dart';
import 'package:diyabet_app/core/init/navigation/navigation_service.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/core/theme_widgets/input/carbapp_password_text_input.dart';
import 'package:diyabet_app/core/theme_widgets/input/carbapp_text_input.dart';
import 'package:diyabet_app/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../core/theme_widgets/dialog/alert_dialogs.dart';

part 'components/reset_password_components.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController newPasswordController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

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
            if (state is ResetPasswordSuccess) {
              showAlertDialogDefault(
                context: context,
                title: "Şifre Güncelleme",
                isDissmisableInTime: true,
                dissmissSeconds: 4,
                content: SizedBox(
                  height: 100,
                  child: Center(
                    child: Text(
                      state.successMessage,
                      style: Theme.of(context).textTheme.unAuthorizedMessage,
                    ),
                  ),
                ),
              );
            }

            if (state is ResetPasswordError) {
              showAlertDialogDefault(
                context: context,
                title: "Şifre Güncelleme",
                isDissmisableInTime: true,
                dissmissSeconds: 4,
                content: SizedBox(
                  height: 100,
                  child: Center(
                    child: Text(
                      state.errorMessage,
                      style: Theme.of(context).textTheme.unAuthorizedMessage,
                    ),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is ResetPasswordLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            return SingleChildScrollView(
              child: Padding(
                padding: context.paddingMedium,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "KARBAPP",
                          style: Theme.of(context).textTheme.textLogo,
                        ),
                      ),
                      const SizedBox(height: 70),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Şifremi Unuttum",
                          style: Theme.of(context).textTheme.loginHeader,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "E-posta adresinizi girerek şifrenizi sıfırlayabilirsiniz.",
                        style: Theme.of(context).textTheme.inputLabel,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text("E-Posta", style: Theme.of(context).textTheme.inputLabel),
                      const SizedBox(height: 9),
                      CarbAppTextInput(
                        inputIcon: IconlyLight.message,
                        iconSize: 24,
                        iconColor: const Color(0xff130F26),
                        inputTextStyle: Theme.of(context).textTheme.headline4,
                        inputBorderRadius: 15,
                        inputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        textController: emailController,
                        focuNode: emailFocus,
                        onFieldSubmit: (value) {
                          emailFocus.unfocus();
                          passwordFocus.requestFocus();
                          return null;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "E-Posta alanı boş bırakılamaz";
                          }

                          if (!value.isValidEmail) {
                            return "Lütfen geçerli bir e-posta adresi giriniz.";
                          }
                          return null;
                        },
                      ),
                      Text("Yeni Şifre", style: Theme.of(context).textTheme.inputLabel),
                      const SizedBox(height: 9),
                      CarbAppPasswordTextInput(
                        inputIcon: IconlyLight.lock,
                        iconSize: 24,
                        iconColor: const Color(0xff130F26),
                        inputTextStyle: Theme.of(context).textTheme.headline4,
                        inputBorderRadius: 15,
                        inputAction: TextInputAction.done,
                        textController: newPasswordController,
                        focuNode: passwordFocus,
                        onFieldSubmit: (value) {
                          passwordFocus.unfocus();
                          return null;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Yeni şifre alanı boş bırakılamaz.";
                          }

                          if (!value.isValidPassword) {
                            return "Yeni şifreniz 6 karakterden az olamaz.";
                          }
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Şifreni hatırlıyor musun?",
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
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }

                          BlocProvider.of<AuthCubit>(context).userPasswordReset(emailController.text, newPasswordController.text);
                        },
                        style: ElevatedButton.styleFrom(elevation: 0),
                        child: const Center(
                          child: Text("Gönder"),
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
            );
          },
        ),
      ),
    );
  }
}
