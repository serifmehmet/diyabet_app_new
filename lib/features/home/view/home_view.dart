import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../core/constants/enums/preferences_keys.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/init/cache/cache_manager.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../core/init/theme/app_theme.dart';
import '../../auth/cubit/cubit/auth_cubit.dart';
import '../widgets/home_end_drawer_widget.dart';
import 'tab/model/food_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var items = FoodModels.create();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawerEnableOpenDragGesture: true,
      endDrawer: HomeEndDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        actions: [
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is Authenticated) {
                return Padding(
                  padding: EdgeInsets.only(right: context.paddingNormal.right),
                  child: IconButton(
                    onPressed: () {
                      _openEndDrawer();
                    },
                    icon: Icon(Icons.menu, size: 40, color: Theme.of(context).colorScheme.secondaryVariant),
                  ),
                );
              }

              return const SizedBox();
            },
          )
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: context.paddingNormal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is Authenticated) {
                    return Text(
                      "Merhaba, " + CacheManager.instance.getStringValue(PreferencesKeys.USER_NAME),
                      style: Theme.of(context).textTheme.welcomeText,
                    );
                  }

                  if (state is UnAuthenticated) {
                    return Text(
                      "Merhaba, Konuk",
                      style: Theme.of(context).textTheme.welcomeText,
                    );
                  }
                  return SizedBox();
                },
              ),
            ),
            Center(
              child: Text(
                "Karbonhidrat hesaplamak için yemek ekleyerek başlayabilirsin.",
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            //MainSubHeaderWidget(),
            // CacheManager.instance.getBoolValue(PreferencesKeys.IS_LOGGEDIN) ? const SizedBox() : subHeaderArea(context),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is UnAuthenticated) {
                  return subHeaderArea(context);
                }

                if (state is Authenticated) {
                  return const SizedBox();
                }

                return const SizedBox();
              },
            ),

            const SizedBox(
              height: 30,
            ),
            Text(
              "En Çok Eklenen Besinler",
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(
              height: 30,
            ),
            favoriteFoodList()
          ],
        ),
      ),
    );
  }

  Expanded favoriteFoodList() {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(items.foodItems[index].name, style: Theme.of(context).textTheme.orangeText),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: Theme.of(context).colorScheme.secondary,
                    ))
              ],
            ),
          );
        },
        itemCount: items.foodItems.length,
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            width: double.infinity,
            height: 1,
            decoration: const BoxDecoration(
              color: Color(0xffF5F5F5),
            ),
          );
        },
      ),
    );
  }

  Container subHeaderArea(BuildContext context) {
    return Container(
      height: 88,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Stack(
        children: [
          subHeaderLeftSide(context),
          subHeaderRightSide(context),
        ],
      ),
    );
  }

  Row subHeaderRightSide(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: context.width * 0.48,
          height: double.infinity,
          child: Padding(
            padding: context.paddingNormal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Login button
                ElevatedButton(
                  onPressed: () {
                    NavigationService.instance.navigateToPage(path: NavigationConstants.LOGIN);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffffffff),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 22),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Giriş Yap",
                        style: Theme.of(context).textTheme.orangeText,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        IconlyBold.arrow_right_2,
                        color: Color(0xffD6578A),
                        size: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Color(0xffDB6896),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(70),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
        ),
      ],
    );
  }

  Container subHeaderLeftSide(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(top: 15, bottom: 15, left: 19),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: context.width * 0.40,
              child: Text("Günlük tüketim ve hesaplamalarını kaydetmek için giriş yap.", style: Theme.of(context).textTheme.subtitle1),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Color(0xFFD6578A),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
    );
  }
}
