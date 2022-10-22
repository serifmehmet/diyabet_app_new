import 'package:diyabet_app/core/constants/navigation/navigation_constants.dart';
import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomeEndDrawerWidget extends StatelessWidget {
  const HomeEndDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 40),
            goToProfileWidget(context),
            const SizedBox(height: 10),
            goToMyRecipesWidget(context),
            const SizedBox(height: 10),
            goToDiabetInfoWidget(context)
          ],
        ),
      ),
    );
  }

  Widget goToDiabetInfoWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
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
        Navigator.of(context).pop();
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

  Widget goToProfileWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        NavigationService.instance.navigateToPage(path: NavigationConstants.PROFILE);
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
              "Profilim",
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
