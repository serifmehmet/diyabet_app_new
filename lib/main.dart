import 'package:diyabet_app/core/utils/notification_service.dart';
import 'package:diyabet_app/features/app/app.dart';
import 'package:diyabet_app/features/home/cubit/favorite_foods_cubit.dart';
import 'package:diyabet_app/features/profile/cubit/profile_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/constants/enums/preferences_keys.dart';
import 'core/constants/navigation/navigation_constants.dart';
import 'core/init/cache/cache_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/theme/app_theme.dart' as Theme;
import 'data/datasources/local/local_datasource.dart';
import 'features/auth/cubit/cubit/auth_cubit.dart';
import 'features/food/cubit/food_cubit.dart';
import 'features/food/cubit/food_unit_cubit.dart';
import 'features/home/cubit/bottom_nav_cubit.dart';
import 'features/meal/cubit/bolus_cubit.dart';
import 'features/meal/cubit/meal_consumption_cubit.dart';
import 'features/my_diabet/cubit/blood_target_cubit.dart';
import 'features/my_diabet/cubit/iko_cubit.dart';
import 'features/my_diabet/cubit/my_diabet_cubit.dart';
import 'features/reciept/cubit/recipe_cubit.dart';
import 'features/search/cubit/search_cubit.dart';
import 'features/totals/cubit/totals_cubit.dart';
import 'features/reciept/cubit/recipe_food_search_cubit.dart';
import 'injection_container.dart' as di;

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

void listenToNotification() => service.onNotificationClick.stream.listen(onNotificationListener);
void onNotificationListener(String? payload) {
  if (payload != null && payload.isNotEmpty) {
    if (payload == "activation") {
      NavigationService.instance.navigateToPageClear(path: NavigationConstants.LOGIN);
    }
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await di.init();
  await LocalDataSource.initialize();
  await CacheManager.preferencesInit();

  await Firebase.initializeApp();

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    await messaging.getToken().then((value) {
      CacheManager.instance.setStringValue(PreferencesKeys.NOTIFICATION_TOKEN, value!);
    });
  }

  if (!kIsWeb) {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (bottomBarContext) => di.sl<BottomNavCubit>(),
        ),
        BlocProvider(
          create: (authContext) => di.sl<AuthCubit>()..appStarted(),
        ),
        BlocProvider(
          create: (profileContext) => di.sl<ProfileCubit>(),
        ),
        BlocProvider(
          create: (totalsContext) => di.sl<TotalsCubit>(),
        ),
        BlocProvider(
          create: (searchContext) => di.sl<SearchCubit>(),
        ),
        BlocProvider(
          create: (foodContext) => di.sl<FoodCubit>(),
        ),
        BlocProvider(
          create: (favoriteFoodsContext) => di.sl<FavoriteFoodsCubit>(),
        ),
        BlocProvider(
          create: (foodUnitContext) => di.sl<FoodUnitCubit>(),
        ),
        BlocProvider(
          create: (recipeContext) => di.sl<RecipeCubit>(),
        ),
        BlocProvider(
          create: (recipeFoodSearchContext) => di.sl<RecipeFoodSearchCubit>(),
        ),
        BlocProvider(
          create: (foodConsumptionContext) => di.sl<MealConsumptionCubit>(),
        ),
        BlocProvider(
          create: (myDiabetContext) => di.sl<MyDiabetCubit>(),
        ),
        BlocProvider(
          create: (ikContext) => di.sl<IkoCubit>(),
        ),
        BlocProvider(
          create: (btContext) => di.sl<BloodTargetCubit>(),
        ),
        BlocProvider(
          create: (bolusContext) => di.sl<BolusCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'KarbApp',
        theme: Theme.appTheme,
        navigatorKey: NavigationService.instance.navigatorKey,
        onGenerateRoute: (settings) => NavigationRoute.instance.generateRoute(settings),
        localizationsDelegates: const [GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
        supportedLocales: const [Locale("tr")],
        home: const KarbApp(),
      ),
    );
  }
}
