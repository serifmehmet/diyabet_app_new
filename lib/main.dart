import 'package:diyabet_app/data/datasources/remote/food/food_remote_datasouce.dart';
import 'package:diyabet_app/data/repositories/food_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexana/vexana.dart';

import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/theme/app_theme.dart' as Theme;
import 'ui/home/view/tab/app_tab_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => NetworkManager(options: BaseOptions()),
      ),
      RepositoryProvider<FoodRemoteDataSource>(
        create: (context) => FoodRemoteDataSource(context.read<NetworkManager>()),
      ),
      RepositoryProvider<FoodRepository>(
        create: (context) => FoodRepositoryImpl(
          foodRemoteDataSource: context.read<FoodRemoteDataSource>(),
        ),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pedider App',
        theme: Theme.appTheme,
        home: const AppTabView(),
        navigatorKey: NavigationService.instance.navigatorKey,
        onGenerateRoute: (settings) => NavigationRoute.instance.generateRoute(settings));
  }
}
