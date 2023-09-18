import 'package:diyabet_app/core/constants/app_sizes.dart';
import 'package:diyabet_app/core/constants/navigation/navigation_constants.dart';
import 'package:diyabet_app/core/extensions/context_extensions.dart';
import 'package:diyabet_app/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

class UserManuelView extends StatelessWidget {
  const UserManuelView({Key? key}) : super(key: key);

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
          title: Text("Kullanım Kılavuzu", style: Theme.of(context).textTheme.headline3),
        ),
        body: Padding(
          padding: context.paddingMedium,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => NavigationService.instance.navigateToPage(
                  path: NavigationConstants.SEARCH_FOOD_MANUEL,
                ),
                child: const Center(
                  child: Text(
                    'Arama Ekranı',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              gapH20,
              ElevatedButton(
                onPressed: () => NavigationService.instance.navigateToPage(
                  path: NavigationConstants.DIABET_INFO,
                ),
                child: const Center(
                  child: Text(
                    'Diyabet Bilgileri',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              gapH20,
              ElevatedButton(
                onPressed: () => NavigationService.instance.navigateToPage(
                  path: NavigationConstants.BOLUS_INFO,
                ),
                child: const Center(
                  child: Text(
                    'Bolus Hesaplama',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              gapH20,
              ElevatedButton(
                onPressed: () => NavigationService.instance.navigateToPage(
                  path: NavigationConstants.RECIPE_INFO,
                ),
                child: const Center(
                  child: Text(
                    'Tarif Ekleme',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
