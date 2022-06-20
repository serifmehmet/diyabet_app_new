import 'package:diyabet_app/core/constants/enums/preferences_keys.dart';
import 'package:diyabet_app/features/meal/cubit/meal_consumption_cubit.dart';
import 'package:diyabet_app/features/home/cubit/bottom_nav_cubit.dart';
import 'package:diyabet_app/features/my_diabet/cubit/my_diabet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/init/cache/cache_manager.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/theme/app_theme.dart' as Theme;
import 'data/datasources/local/local_datasource.dart';
import 'features/auth/cubit/cubit/auth_cubit.dart';
import 'features/auth/view/splash_view.dart';
import 'features/food/cubit/food_cubit.dart';
import 'features/food/cubit/food_unit_cubit.dart';
import 'features/reciept/cubit/reciept_cubit.dart';
import 'features/search/cubit/search_cubit.dart';
import 'features/totals/cubit/totals_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await LocalDataSource.initialize();
  await CacheManager.preferencesInit();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String? token = '';
  await messaging.getToken().then((value) {
    token = value;
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

  print('User granted permission: ${settings.authorizationStatus}');

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
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
          create: (recieptCubit) => di.sl<RecieptCubit>(),
        ),
        BlocProvider(
          create: (foodConsumptionContext) => di.sl<MealConsumptionCubit>(),
        ),
        BlocProvider(
          create: (myDiabetContext) => di.sl<MyDiabetCubit>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pedider App',
        theme: Theme.appTheme,
        navigatorKey: NavigationService.instance.navigatorKey,
        onGenerateRoute: (settings) => NavigationRoute.instance.generateRoute(settings),
        localizationsDelegates: const [GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
        supportedLocales: const [Locale("tr")],
        home: const SplashView(),
      ),
    );
  }
}
