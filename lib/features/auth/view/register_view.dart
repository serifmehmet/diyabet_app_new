import 'package:diyabet_app/core/constants/enums/preferences_keys.dart';
import 'package:diyabet_app/core/constants/navigation/navigation_constants.dart';
import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/extensions/string_extension.dart';
import 'package:diyabet_app/core/init/cache/cache_manager.dart';
import 'package:diyabet_app/core/init/navigation/navigation_service.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/core/theme_widgets/input/carbapp_password_text_input.dart';
import 'package:diyabet_app/core/theme_widgets/input/carbapp_text_input.dart';
import 'package:diyabet_app/domain/entities/user.dart';
import 'package:diyabet_app/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

part 'components/register_components.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstPasswordController = TextEditingController();
  final TextEditingController secondPasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController sureNameController = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode surNameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode firstPasswordFocus = FocusNode();
  FocusNode secondPasswordFocus = FocusNode();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String? firstPassword;
    final focus = FocusScope.of(context);

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
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is UserRegisterFailure) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Hata"),
                        content: Text(
                          state.errorMessage!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      );
                    },
                  );
                }
              },
              builder: (context, state) {
                if (state is UserRegistering) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Form(
                  key: formKey,
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
                      const SizedBox(height: 20),
                      Text(
                        "Kayıt Ol",
                        style: Theme.of(context).textTheme.loginHeader,
                      ),
                      const SizedBox(height: 30),
                      Text("Ad", style: Theme.of(context).textTheme.inputLabel),
                      const SizedBox(height: 9),
                      CarbAppTextInput(
                        inputIcon: IconlyLight.profile,
                        iconSize: 24,
                        iconColor: const Color(0xff130F26),
                        inputTextStyle: Theme.of(context).textTheme.headline4,
                        inputBorderRadius: 15,
                        textController: nameController,
                        focuNode: nameFocus,
                        onFieldSubmit: (val) {
                          nameFocus.unfocus();
                          focus.requestFocus(surNameFocus);
                          return null;
                        },
                        inputAction: TextInputAction.next,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Ad-Soyad alanı boş bırakılamaz";
                          }
                          return null;
                        },
                      ),
                      Text("Soyad", style: Theme.of(context).textTheme.inputLabel),
                      const SizedBox(height: 9),
                      CarbAppTextInput(
                        inputIcon: IconlyLight.profile,
                        iconSize: 24,
                        iconColor: const Color(0xff130F26),
                        inputTextStyle: Theme.of(context).textTheme.headline4,
                        inputBorderRadius: 15,
                        textController: sureNameController,
                        focuNode: surNameFocus,
                        onFieldSubmit: (val) {
                          surNameFocus.unfocus();
                          focus.requestFocus(emailFocus);
                          return null;
                        },
                        inputAction: TextInputAction.next,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Ad-Soyad alanı boş bırakılamaz";
                          }
                          return null;
                        },
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
                        textController: emailController,
                        focuNode: emailFocus,
                        onFieldSubmit: (val) {
                          emailFocus.unfocus();
                          focus.requestFocus(firstPasswordFocus);
                          return null;
                        },
                        inputAction: TextInputAction.next,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "E-Posta adresi alanı boş bırakılamaz.";
                          }
                          if (!val.isValidEmail) {
                            return "E-Posta adresi hatalı";
                          }
                          return null;
                        },
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
                        textController: firstPasswordController,
                        focuNode: firstPasswordFocus,
                        onFieldSubmit: (val) {
                          firstPasswordFocus.unfocus();
                          focus.requestFocus(secondPasswordFocus);
                          return null;
                        },
                        inputAction: TextInputAction.next,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Şifre alanı boş bırakılamaz";
                          }

                          if (!val.isValidPassword) {
                            return "Şifre uzunluğu 8 karakterden fazla olmalıdır";
                          }

                          firstPassword = val;
                          return null;
                        },
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
                          textController: secondPasswordController,
                          focuNode: secondPasswordFocus,
                          onFieldSubmit: (val) {
                            secondPasswordFocus.unfocus();

                            return null;
                          },
                          inputAction: TextInputAction.next,
                          validator: (val) {
                            if (val != firstPassword) {
                              return "İlk girdiğiniz şifre ile eşleşmiyor";
                            }
                            return null;
                          }),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            User user = User(
                              Email: emailController.text,
                              Password: secondPasswordController.text,
                              Name: nameController.text,
                              SurName: sureNameController.text,
                              FcmRegistrationToken: CacheManager.instance.getStringValue(PreferencesKeys.NOTIFICATION_TOKEN),
                            );

                            BlocProvider.of<AuthCubit>(context).userRegister(user);
                          }
                        },
                        style: ElevatedButton.styleFrom(elevation: 0),
                        child: const Center(
                          child: Text("Kayıt Ol"),
                        ),
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
