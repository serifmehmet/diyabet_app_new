import 'package:diyabet_app/core/init/navigation/navigation_route.dart';
import 'package:diyabet_app/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

import 'core/init/theme/app_theme.dart' as Theme;
import 'features/home/view/tab/app_tab_view.dart';

void main() {
  runApp(const MyApp());
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
