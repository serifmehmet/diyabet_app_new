import 'package:diyabet_app/core/constants/navigation/navigation_constants.dart';
import 'package:diyabet_app/core/theme_widgets/card/not_found_navigation_widget.dart';
import 'package:diyabet_app/features/auth/view/forgot_password_view.dart';
import 'package:diyabet_app/features/auth/view/login_view.dart';
import 'package:diyabet_app/features/auth/view/register_view.dart';
import 'package:diyabet_app/features/home/view/tab/app_tab_view.dart';
import 'package:diyabet_app/features/profile/view/profile_view.dart';
import 'package:diyabet_app/features/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const SplashView(), NavigationConstants.DEFAULT);
      case NavigationConstants.HOME_PAGE:
        return normalNavigate(const AppTabView(), NavigationConstants.HOME_PAGE);
      case NavigationConstants.PROFILE:
        return normalNavigate(const ProfileView(), NavigationConstants.PROFILE);
      case NavigationConstants.LOGIN:
        return normalNavigate(const LoginView(), NavigationConstants.LOGIN);
      case NavigationConstants.REGISTER:
        return normalNavigate(const RegisterView(), NavigationConstants.REGISTER);
      case NavigationConstants.FORGOT_PASSWORD:
        return normalNavigate(const ForgotPasswordView(), NavigationConstants.FORGOT_PASSWORD);
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: pageName),
    );
  }
}
