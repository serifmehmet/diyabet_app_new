import 'package:flutter/material.dart';

const String FONT_FAMILY = "WorkSans";

final ThemeData appTheme = ThemeData(
  fontFamily: FONT_FAMILY,
  primaryColor: const Color(0xff578AD6),
  primaryColorDark: const Color(0xff335234),
  primaryColorLight: const Color(0xffCFE7CB),
  backgroundColor: const Color(0xffFFFFFF),
  cardColor: const Color(0xffFFF8EE),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: const Color(0xffD6578A),
    secondaryContainer: const Color(0xFF999999),
    tertiary: const Color(0xff1BC47D),
    surface: const Color(0xFFF5F5F5),
  ),
  dividerColor: const Color(0xfff6f6f6),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: const Color(0xff578AD6),
      padding: const EdgeInsets.symmetric(
        vertical: 21,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      textStyle: const TextStyle(
        color: Color(0xffffffff),
        fontSize: 25,
        fontFamily: "Signika",
      ),
      elevation: 0,
    ),
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: Color(0xffffffff),
      fontSize: 48,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: "Nunito",
    ),
    headline2: TextStyle(
      color: Color(0xffCFE7CB),
      fontSize: 25,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: "Nunito",
    ),
    headline3: TextStyle(
      color: Color(0xff0e150e),
      fontSize: 22,
      fontFamily: "Signika",
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    headline4: TextStyle(
      color: Color(0xff7b7b7b),
      fontSize: 18,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: "Signika",
    ),
    headline5: TextStyle(
      color: Color(0xff0e150e),
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: "Signika",
    ),
    headline6: TextStyle(
      color: Color(0xff0e150e),
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: "Signika",
    ),
    subtitle1: TextStyle(
      color: Color(0xffFFFFFF),
      fontFamily: "Signika",
      fontSize: 15,
      decoration: TextDecoration.none,
    ),
    caption: TextStyle(
      color: Color(0xffFFFFFF),
      fontFamily: "Signika",
      fontSize: 30,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none,
    ),
    bodyText1: TextStyle(
      color: Color(0xff000000),
      fontFamily: "Signika",
      fontSize: 24,
      fontWeight: FontWeight.w400,
    ),
    bodyText2: TextStyle(
      color: Color(0xff000000),
      fontFamily: "Signika",
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    overline: TextStyle(
      color: Color(0xFFFF0000),
      fontFamily: "Signika",
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
  ),
);

extension CustomStyles on TextTheme {
  TextStyle get loginHeader {
    return const TextStyle(
      color: Color(0xff000000),
      fontSize: 25,
      fontStyle: FontStyle.normal,
      fontFamily: "Signika",
      letterSpacing: 1,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none,
    );
  }

  TextStyle get logo {
    return const TextStyle(
      color: Color(0xffffffff),
      fontSize: 48,
      fontStyle: FontStyle.normal,
      fontFamily: "Nunito",
      decoration: TextDecoration.none,
    );
  }

  TextStyle get homepageLoginButton {
    return const TextStyle(
      color: Color(0xff9E9BC7),
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontFamily: "Signika",
      decoration: TextDecoration.none,
    );
  }

  TextStyle get welcomeText {
    return const TextStyle(
      color: Color(0xff1BC47D),
      fontSize: 25,
      fontStyle: FontStyle.normal,
      fontFamily: "Signika",
      decoration: TextDecoration.none,
      height: 2.8,
    );
  }

  TextStyle get textLogo {
    return const TextStyle(
      color: Color(0xff578AD6),
      fontSize: 25,
      letterSpacing: 0.24,
      fontStyle: FontStyle.normal,
      fontFamily: "Nunito",
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none,
    );
  }

  TextStyle get orangeText {
    return const TextStyle(
      color: Color(0xffD6578A),
      fontSize: 16,
      fontFamily: "Signika",
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get addRecipeText {
    return const TextStyle(
      color: Color(0xffD6578A),
      fontSize: 20,
      fontFamily: "Signika",
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle get orangeForgotPasswordText {
    return const TextStyle(
      color: Color(0xffD6578A),
      fontSize: 18,
      fontFamily: "Signika",
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get bolusScreenRed {
    return const TextStyle(
      color: Color(0xffD6578A),
      fontSize: 13,
      fontFamily: "Signika",
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get profileHeader {
    return const TextStyle(
      color: Color(0xff272727),
      fontSize: 25,
      fontFamily: "Signika",
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get inputLabel {
    return const TextStyle(
      color: Color(0xff999999),
      fontSize: 20,
      fontFamily: "Signika",
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get searchNotFound {
    return const TextStyle(
      color: Color(0xff696969),
      fontSize: 22,
      fontFamily: "Signika",
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get searchNotFoundLight {
    return const TextStyle(
      color: Color(0xffA9A9A9),
      fontSize: 16,
      fontFamily: "Signika",
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get genericHeader {
    return const TextStyle(
      color: Color(0xff000000),
      fontSize: 24,
      fontFamily: "Signika",
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle get genericHeaderBig {
    return const TextStyle(
      color: Color(0xff000000),
      fontSize: 40,
      fontFamily: "Signika",
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w600,
    );
  }
}
