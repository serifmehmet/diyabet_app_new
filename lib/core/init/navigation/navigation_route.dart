import 'package:diyabet_app/core/theme_widgets/auth/not_authenticated_widget.dart';
import 'package:diyabet_app/features/auth/view/kvkk_view.dart';
import 'package:diyabet_app/features/my_diabet/view/my_diabet_view.dart';
import 'package:diyabet_app/features/onboard/view/onboard_view.dart';
import 'package:diyabet_app/features/profile/view/edit_profile_view.dart';
import 'package:diyabet_app/features/profile/view/privacy_text_view.dart';
import 'package:diyabet_app/features/reciept/view/add_reciept_view.dart';
import 'package:diyabet_app/features/reciept/view/recipe_list_view.dart';
import 'package:diyabet_app/features/user_manuel/views/calculate_bolus_manual_view.dart';
import 'package:diyabet_app/features/user_manuel/views/diabet_info_manual_view.dart';
import 'package:diyabet_app/features/user_manuel/views/recipe_manual_view.dart';
import 'package:diyabet_app/features/user_manuel/views/search_food_manuel_view.dart';
import 'package:diyabet_app/features/user_manuel/views/user_manuel_view.dart';
import 'package:flutter/material.dart';

import '../../../features/auth/view/forgot_password_view.dart';
import '../../../features/auth/view/login_view.dart';
import '../../../features/auth/view/register_view.dart';
import '../../../features/home/view/tab/app_tab_view.dart';
import '../../../features/profile/view/profile_view.dart';
import '../../../features/auth/view/splash_view.dart';
import '../../constants/navigation/navigation_constants.dart';
import '../../theme_widgets/card/not_found_navigation_widget.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const SplashView(), NavigationConstants.DEFAULT);
      case NavigationConstants.ONBOARD:
        return normalNavigate(const OnboardView(), NavigationConstants.ONBOARD);
      case NavigationConstants.HOME_PAGE:
        return normalNavigate(const AppTabView(), NavigationConstants.HOME_PAGE);
      case NavigationConstants.PROFILE:
        return normalNavigate(const ProfileView(), NavigationConstants.PROFILE);
      case NavigationConstants.EDIT_PROFILE:
        return normalNavigate(const EditProfileView(), NavigationConstants.EDIT_PROFILE);
      case NavigationConstants.USER_MANUEL:
        return normalNavigate(const UserManuelView(), NavigationConstants.USER_MANUEL);
      case NavigationConstants.SEARCH_FOOD_MANUEL:
        return normalNavigate(const SearchFoodManualView(), NavigationConstants.SEARCH_FOOD_MANUEL);
      case NavigationConstants.DIABET_INFO:
        return normalNavigate(const DiabetInfoView(), NavigationConstants.DIABET_INFO);
      case NavigationConstants.BOLUS_INFO:
        return normalNavigate(const CalculateBolusView(), NavigationConstants.BOLUS_INFO);
      case NavigationConstants.RECIPE_INFO:
        return normalNavigate(const RecipeManualView(), NavigationConstants.RECIPE_INFO);
      case NavigationConstants.LOGIN:
        return normalNavigate(LoginView(), NavigationConstants.LOGIN);
      case NavigationConstants.REGISTER:
        return normalNavigate(const RegisterView(), NavigationConstants.REGISTER);
      case NavigationConstants.KVKK:
        return normalNavigate(const KvKKView(), NavigationConstants.KVKK);
      case NavigationConstants.PRIVACY:
        return normalNavigate(const PrivacyTextView(), NavigationConstants.PRIVACY);
      case NavigationConstants.FORGOT_PASSWORD:
        return normalNavigate(const ForgotPasswordView(), NavigationConstants.FORGOT_PASSWORD);
      case NavigationConstants.ADD_RECIEPT:
        return normalNavigate(const AddRecieptView(), NavigationConstants.ADD_RECIEPT);
      case NavigationConstants.RECIPE_LIST:
        return normalNavigate(const RecipeListView(), NavigationConstants.RECIPE_LIST);
      case NavigationConstants.MY_DIABET:
        return normalNavigate(const MyDiabetView(), NavigationConstants.MY_DIABET);
      case NavigationConstants.NOT_AUTHENTICATED:
        return normalNavigate(const NotAuthenticated(), NavigationConstants.NOT_AUTHENTICATED);
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
