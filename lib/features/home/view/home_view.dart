import 'package:diyabet_app/features/home/cubit/favorite_foods_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../core/constants/enums/preferences_keys.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/init/cache/cache_manager.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../core/init/theme/app_theme.dart';
import '../../../core/theme_widgets/bottom_sheet/bottom_sheet_widget.dart';
import '../../../core/utils/notification_service.dart';
import '../../../domain/entities/favorite_food.dart';
import '../../auth/cubit/cubit/auth_cubit.dart';
import '../../food/cubit/food_unit_cubit.dart';
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

  late final NotificationService service;
  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    service = NotificationService();
    service.initalize();
    listenToNotification();
    await service.showNotificaction(
      id: message.hashCode,
      title: "Karbapp Aktivasyon",
      body: message.data["messageText"],
      payload: message.data["messageType"],
    );
  }

  @override
  void initState() {
    super.initState();
    service = NotificationService();
    service.initalize();
    listenToNotification();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      // RemoteNotification? notification = message.notification;
      // AndroidNotification? android = message.notification?.android;

      if (message.data.isNotEmpty) {
        await service.showNotificaction(
            id: message.hashCode, title: "Aktivasyon", body: message.data["messageText"], payload: message.data["messageType"]);
      }

      // if (notification != null && android != null && !kIsWeb) {
      //   await service.showNotificaction(
      //       id: notification.hashCode, title: notification.title!, body: notification.body!, payload: message.data["messageType"]);
      // }
    });
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  void listenToNotification() => service.onNotificationClick.stream.listen(onNotificationListener);

  void onNotificationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      if (payload == "activation") {
        NavigationService.instance.navigateToPageClear(path: NavigationConstants.LOGIN);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: context.paddingNormal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is Authenticated) {
                    return Text(
                      "Merhaba, ${CacheManager.instance.getStringValue(PreferencesKeys.USER_NAME)}",
                      style: Theme.of(context).textTheme.welcomeText,
                    );
                  }

                  if (state is UnAuthenticated) {
                    return Text(
                      "Merhaba",
                      style: Theme.of(context).textTheme.welcomeText,
                    );
                  }

                  if (state is Registered) {
                    return Text(
                      "Kayıt işleminiz başarılı bir şekilde sonuçlandı. Aktivasyon için lütfen e-posta kutunuzu kontrol ediniz.",
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                    );
                  }
                  return const SizedBox();
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
            if (CacheManager.instance.getBoolValue(PreferencesKeys.IS_LOGGEDIN) == true) ...[
              Text(
                "En Çok Eklenen Besinler",
                style: Theme.of(context).textTheme.headline3,
              ),
              BlocBuilder<FavoriteFoodsCubit, FavoriteFoodsState>(
                builder: (context, state) {
                  return state.map(
                      loading: (loading) => Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor)),
                      emptyFavoriteFoods: (emptyFavoriteFoods) => Center(
                            child: Text(
                              emptyFavoriteFoods.emptyListMessage,
                              textAlign: TextAlign.center,
                            ),
                          ),
                      favoriteFoodsLoaded: (favoriteFoodsLoaded) {
                        return favoriteFoodList(favoriteFoodsLoaded.favoriteFood.favoriteFoods!);
                      });
                },
              ),
            ] else ...[
              Center(
                child: Image.asset(
                  "assets/logo.png",
                  width: 250,
                  height: 250,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget favoriteFoodList(List<FavoriteFood> favoriteFoods) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(32),
                      ),
                    ),
                    isScrollControlled: true,
                    builder: (context) {
                      return BottomSheetWidget(
                        foodId: favoriteFoods[index].foodId!,
                        type: BottomSheetType.search,
                      );
                    }).whenComplete(
                  () => BlocProvider.of<FoodUnitCubit>(context).clearUnits(),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(favoriteFoods[index].foodName!, style: Theme.of(context).textTheme.orangeText),
                    Icon(
                      Icons.add,
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: favoriteFoods.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            color: Color(0xffF5F5F5),
            height: 5,
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
          decoration: const BoxDecoration(
            color: Color(0xffDB6896),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
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
        ),
      ],
    );
  }

  Container subHeaderLeftSide(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFD6578A),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15, left: 19),
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
    );
  }
}
