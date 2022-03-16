import 'package:diyabet_app/ui/search/cubit/search_cubit.dart';
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
          create: (searchContext) => di.sl<SearchCubit>(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pedider App',
          theme: Theme.appTheme,
          home: const AppTabView(),
          navigatorKey: NavigationService.instance.navigatorKey,
          onGenerateRoute: (settings) => NavigationRoute.instance.generateRoute(settings)),
    );
  }
}
