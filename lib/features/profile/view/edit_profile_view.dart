import 'package:diyabet_app/core/constants/enums/preferences_keys.dart';
import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/cache/cache_manager.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:diyabet_app/core/theme_widgets/dialog/alert_dialogs.dart';
import 'package:diyabet_app/core/theme_widgets/input/carbapp_password_text_input.dart';
import 'package:diyabet_app/core/theme_widgets/input/carbapp_text_input.dart';
import 'package:diyabet_app/features/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nameController = TextEditingController();
  late TextEditingController surNameController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  final FocusNode fName = FocusNode();
  final FocusNode fsurName = FocusNode();
  final FocusNode fPassword = FocusNode();

  String getNameFromCache() {
    final String name;
    final String secondName;
    String fullName = CacheManager.instance.getStringValue(PreferencesKeys.USER_NAME);

    if (fullName.split(" ").length > 2) {
      name = fullName.split(" ")[0];
      secondName = fullName.split(" ")[1];

      return "$name $secondName";
    } else {
      return fullName.split(" ").first;
    }
  }

  @override
  void initState() {
    String name = getNameFromCache();
    String surName = CacheManager.instance.getStringValue(PreferencesKeys.USER_NAME).split(" ").last;

    passwordController.text = CacheManager.instance.getStringValue(PreferencesKeys.PASSWORD);
    nameController.text = name;
    surNameController.text = surName;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    surNameController.dispose();
    passwordController.dispose();

    fName.dispose();
    fsurName.dispose();
    fPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text("Profili Düzenle", style: Theme.of(context).textTheme.headline3),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          state.whenOrNull(
            profileUpdated: (message) {
              showAlertDialogDefault(
                context: context,
                title: "Profil Güncellemesi",
                isDissmisableInTime: true,
                dissmissSeconds: 4,
                content: SizedBox(
                  height: 100,
                  child: Center(
                    child: Text(
                      message,
                      style: Theme.of(context).textTheme.unAuthorizedMessage,
                    ),
                  ),
                ),
              );
            },
            profileUpdateError: (errorMessage) {
              showAlertDialogDefault(
                context: context,
                title: "Profil Güncellemesi",
                isDissmisableInTime: true,
                dissmissSeconds: 4,
                content: SizedBox(
                  height: 100,
                  child: Center(
                    child: Text(
                      errorMessage,
                      style: Theme.of(context).textTheme.unAuthorizedMessage,
                    ),
                  ),
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator.adaptive()),
            orElse: () {
              return Padding(
                padding: context.paddingMedium,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ad",
                          style: Theme.of(context).textTheme.inputLabel,
                        ),
                        const SizedBox(height: 20),
                        CarbAppTextInput(
                          inputIcon: IconlyLight.profile,
                          iconSize: 24,
                          iconColor: const Color(0xff130F26),
                          inputTextStyle: Theme.of(context).textTheme.headline4,
                          inputBorderRadius: 15,
                          textController: nameController,
                          focuNode: fName,
                          onFieldSubmit: (val) {
                            fName.unfocus();
                            fsurName.requestFocus();
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
                        const SizedBox(height: 20),
                        Text(
                          "Soyad",
                          style: Theme.of(context).textTheme.inputLabel,
                        ),
                        const SizedBox(height: 20),
                        CarbAppTextInput(
                          inputIcon: IconlyLight.profile,
                          iconSize: 24,
                          iconColor: const Color(0xff130F26),
                          inputTextStyle: Theme.of(context).textTheme.headline4,
                          inputBorderRadius: 15,
                          textController: surNameController,
                          focuNode: fsurName,
                          onFieldSubmit: (val) {
                            fsurName.unfocus();
                            fPassword.requestFocus();
                            return null;
                          },
                          inputAction: TextInputAction.next,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Soyad alanı boş bırakılamaz";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Şifre",
                          style: Theme.of(context).textTheme.inputLabel,
                        ),
                        const SizedBox(height: 20),
                        CarbAppPasswordTextInput(
                          inputIcon: IconlyLight.profile,
                          iconSize: 24,
                          iconColor: const Color(0xff130F26),
                          inputTextStyle: Theme.of(context).textTheme.headline4,
                          inputBorderRadius: 15,
                          textController: passwordController,
                          focuNode: fPassword,
                          onFieldSubmit: (val) {
                            fPassword.unfocus();

                            return null;
                          },
                          inputAction: TextInputAction.done,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Şifre alanı boş bırakılamaz";
                            }

                            if (val.length < 8) {
                              return "Şifre uzunluğu 6 karakterden az olamaz.";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 50),
                        ElevatedButton(
                          onPressed: () {
                            final name = nameController.text;
                            final surName = surNameController.text;
                            final password = passwordController.text;
                            BlocProvider.of<ProfileCubit>(context).updateUserInfo(name, surName, password);
                          },
                          style: ElevatedButton.styleFrom(elevation: 0),
                          child: const Center(child: Text("Güncelle")),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
