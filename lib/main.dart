import 'package:diyabet_app/core/utils/notification_service.dart';
import 'package:diyabet_app/features/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'features/my_diabet/cubit/iko_cubit.dart';
import 'features/my_diabet/cubit/my_diabet_cubit.dart';
import 'features/my_diabet/cubit/user_blood_target_cubit.dart';
import 'features/reciept/cubit/reciept_cubit.dart';
import 'features/search/cubit/search_cubit.dart';
import 'features/totals/cubit/totals_cubit.dart';
import 'firebase_options.dart';
import 'injection_container.dart' as di;

late final NotificationService service;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await LocalDataSource.initialize();
  await CacheManager.preferencesInit();

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  await messaging.getToken().then((value) {
    CacheManager.instance.setStringValue(PreferencesKeys.NOTIFICATION_TOKEN, value!);
  });

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

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
          create: (totalsContext) => di.sl<TotalsCubit>(),
        ),
        BlocProvider(
          create: (searchContext) => di.sl<SearchCubit>(),
        ),
        BlocProvider(
          create: (foodContext) => di.sl<FoodCubit>(),
        ),
        BlocProvider(
          create: (foodUnitContext) => di.sl<FoodUnitCubit>(),
        ),
        BlocProvider(
          create: (recipeContext) => di.sl<RecipeCubit>(),
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
          create: (userBtContext) => di.sl<UserBloodTargetCubit>(),
        ),
        BlocProvider(
          create: (bolusContext) => di.sl<BolusCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pedider App',
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
