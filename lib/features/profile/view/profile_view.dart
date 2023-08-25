import 'package:diyabet_app/core/constants/enums/preferences_keys.dart';
import 'package:diyabet_app/core/init/cache/cache_manager.dart';
import 'package:diyabet_app/features/home/cubit/bottom_nav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../core/init/theme/app_theme.dart';
import '../../auth/cubit/cubit/auth_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

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
        title: Text("Profil", style: Theme.of(context).textTheme.headline3),
      ),
      body: Padding(
        padding: context.paddingMedium,
        child: mainColumn(context),
      ),
    );
  }

  Column mainColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xff000000),
              width: 1,
            ),
          ),
          child: Center(
            child: Icon(
              IconlyLight.profile,
              color: Theme.of(context).colorScheme.secondaryContainer,
              size: 100,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
          width: double.infinity,
        ),
        Text(
          CacheManager.instance.getStringValue(PreferencesKeys.USER_NAME),
          style: Theme.of(context).textTheme.profileHeader,
        ),
        const SizedBox(
          height: 120,
        ),
        editRow(context),
        const SizedBox(
          height: 15,
        ),
        Divider(
          color: Theme.of(context).dividerColor,
          height: 2,
        ),
        const SizedBox(
          height: 15,
        ),
        privacyRow(context),
        const SizedBox(
          height: 15,
        ),
        logoutRow(context),
      ],
    );
  }

  Row logoutRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Center(
              child: Icon(
                IconlyBold.logout,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 5,
          child: TextButton(
            style: ButtonStyle(
              alignment: Alignment.centerLeft,
              padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(0),
              ),
            ),
            child: Text(
              "Çıkış Yap",
              style: Theme.of(context).textTheme.headline4,
            ),
            onPressed: () {
              BlocProvider.of<AuthCubit>(context).logOut();
              BlocProvider.of<BottomNavCubit>(context).updateSelectedIndex(0);
              NavigationService.instance.navigateToPageClear(path: NavigationConstants.HOME_PAGE);
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: Icon(
            IconlyLight.arrow_right_2,
            color: Theme.of(context).colorScheme.secondaryContainer,
            size: 24,
          ),
        )
      ],
    );
  }

  Row privacyRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Center(
              child: Icon(
                IconlyBold.paper,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 5,
          child: Text(
            "Gizlilik ve Şartlar",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Expanded(
          flex: 1,
          child: Icon(
            IconlyLight.arrow_right_2,
            color: Theme.of(context).colorScheme.secondaryContainer,
            size: 24,
          ),
        )
      ],
    );
  }

  Row settingRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Center(
              child: Icon(
                IconlyBold.setting,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 5,
          child: Text(
            "Ayarlar",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Expanded(
          flex: 1,
          child: Icon(
            IconlyLight.arrow_right_2,
            color: Theme.of(context).colorScheme.secondaryContainer,
            size: 24,
          ),
        )
      ],
    );
  }

  Widget editRow(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigationService.instance.navigateToPage(path: NavigationConstants.EDIT_PROFILE);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Center(
                child: Icon(
                  IconlyBold.profile,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 5,
            child: Text(
              "Profili Düzenle",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Expanded(
            flex: 1,
            child: Icon(
              IconlyLight.arrow_right_2,
              color: Theme.of(context).colorScheme.secondaryContainer,
              size: 24,
            ),
          )
        ],
      ),
    );
  }
}
