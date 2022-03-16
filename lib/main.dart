import 'package:diyabet_app/core/init/cache/cache_manager.dart';
import 'package:diyabet_app/data/datasources/local/local_datasource.dart';
import 'package:diyabet_app/ui/auth/cubit/cubit/auth_cubit.dart';
import 'package:diyabet_app/ui/search/cubit/search_cubit.dart';
import 'package:diyabet_app/ui/auth/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/theme/app_theme.dart' as Theme;
import 'injection_container.dart' as di;
import 'ui/home/view/tab/app_tab_view.dart';

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
          create: (authContext) => di.sl<AuthCubit>()..appStarted(),
        ),
        BlocProvider(
          create: (searchContext) => di.sl<SearchCubit>(),
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
