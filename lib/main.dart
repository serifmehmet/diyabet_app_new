import 'package:diyabet_app/features/calc_report/cubit/food_consumption_cubit.dart';
import 'package:diyabet_app/features/home/cubit/bottom_nav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await LocalDataSource.initialize();
  await CacheManager.preferencesInit();

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
          create: (foodConsumptionContext) => di.sl<FoodConsumptionCubit>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pedider App',
        theme: Theme.appTheme,
        navigatorKey: NavigationService.instance.navigatorKey,
        onGenerateRoute: (settings) => NavigationRoute.instance.generateRoute(settings),
        home: const SplashView(),
      ),
    );
  }
}
