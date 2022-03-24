import 'package:diyabet_app/ui/bolus/view/bolus_view.dart';
import 'package:diyabet_app/ui/calc_report/view/calc_report_view.dart';
import 'package:diyabet_app/ui/totals/view/totals_view.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/init/theme/app_theme.dart';
import '../../../../ui/home/view/home_view.dart';

import '../../../../ui/search/view/search_view.dart';

class AppTabView extends StatefulWidget {
  const AppTabView({Key? key}) : super(key: key);

  @override
  State<AppTabView> createState() => _AppTabViewState();
}

class _AppTabViewState extends State<AppTabView> {
  final _items = [HomeView(), SearchView(), TotalsView(), CalcReportView(), BolusView()];
  int _currentIndex = 0;
  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.paddingNormal,
        child: _items[_currentIndex],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.home),
            activeIcon: Icon(IconlyBold.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.search),
            activeIcon: Icon(IconlyBold.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.paper),
            activeIcon: Icon(IconlyBold.paper),
            label: "List",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.edit_square),
            activeIcon: Icon(IconlyBold.editSquare),
            label: "Calc",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.voice_2),
            activeIcon: Icon(IconlyBold.voice_2),
            label: "Bolus",
          ),
        ],
        currentIndex: _currentIndex,
        selectedIconTheme: IconThemeData(color: appTheme.primaryColor, size: 30),
        unselectedIconTheme: const IconThemeData(
          color: Color(0xff999999),
        ),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
    );
  }
}
