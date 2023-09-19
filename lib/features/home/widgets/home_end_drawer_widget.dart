import 'package:diyabet_app/core/constants/app_sizes.dart';
import 'package:diyabet_app/core/constants/navigation/navigation_constants.dart';
import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/navigation/navigation_service.dart';
import 'package:diyabet_app/core/init/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../core/constants/enums/preferences_keys.dart';
import '../../../core/init/cache/cache_manager.dart';
import '../../auth/cubit/cubit/auth_cubit.dart';
import '../cubit/bottom_nav_cubit.dart';

class HomeEndDrawerWidget extends StatelessWidget {
  const HomeEndDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          gapH32,
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
          gapH20,
          Text(
            CacheManager.instance.getStringValue(PreferencesKeys.USER_NAME),
            style: Theme.of(context).textTheme.profileHeader,
          ),
          gapH20,
          goToUserManualWidget(context),
          gapH12,
          goToMyRecipesWidget(context),
          gapH12,
          goToDiabetInfoWidget(context),
          gapH32,
          editRow(context),
          gapH12,
          privacyRow(context),
          gapH12,
          logoutRow(context),
        ],
      ),
    );
  }

  Widget goToDiabetInfoWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationService.instance.navigateToPage(path: NavigationConstants.MY_DIABET);
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
                  IconlyBold.heart,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 5,
            child: Text(
              "Diyabet Bilgilerim",
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

  Widget goToMyRecipesWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationService.instance.navigateToPage(path: NavigationConstants.RECIPE_LIST);
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
                  IconlyBold.document,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 5,
            child: Text(
              "Tariflerim",
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

  Widget goToUserManualWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationService.instance.navigateToPage(path: NavigationConstants.USER_MANUEL);
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
                  IconlyBold.discovery,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 5,
            child: Text(
              "Kullanım Kılavuzu",
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
          child: TextButton(
            style: ButtonStyle(
              alignment: Alignment.centerLeft,
              padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.all(0),
              ),
            ),
            child: Text(
              'Gizlilik ve Şartlar',
              style: Theme.of(context).textTheme.headline4,
            ),
            onPressed: () {
              NavigationService.instance.navigateToPage(path: NavigationConstants.PRIVACY);
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
              BlocProvider.of<AuthCubit>(context).logOut().then(
                (value) {
                  if (value) {
                    BlocProvider.of<BottomNavCubit>(context).updateSelectedIndex(0);
                    NavigationService.instance.navigateToPageClear(path: NavigationConstants.HOME_PAGE);
                  }
                },
              );
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
}
