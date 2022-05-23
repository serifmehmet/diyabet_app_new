import 'dart:collection';

import 'package:diyabet_app/features/bolus/view/bolus_view.dart';
import 'package:diyabet_app/features/calc_report/view/calc_report_view.dart';
import 'package:diyabet_app/features/totals/view/totals_view.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'dart:math' as math;

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/init/theme/app_theme.dart';
import '../../../../features/home/view/home_view.dart';

import '../../../../features/search/view/search_view.dart';

class AppTabView extends StatefulWidget {
  const AppTabView({Key? key}) : super(key: key);

  @override
  State<AppTabView> createState() => _AppTabViewState();
}

class _AppTabViewState extends State<AppTabView> {
  final _items = [HomeView(), SearchView(), TotalsView(), CalcReportView(), BolusView()];
  int _currentIndex = 0;
  final ListQueue<int> _navigationQueue = ListQueue();

  void onTap(int index) {
    if (index != _currentIndex) {
      _navigationQueue.removeWhere((element) => element == index);
      _navigationQueue.addLast(index);
    }
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_navigationQueue.isEmpty) {
          return true;
        }

        setState(() {
          _navigationQueue.removeLast();
          int position = _navigationQueue.isEmpty ? 0 : _navigationQueue.last;
          _currentIndex = position;
        });
        return false;
      },
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _items,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(IconlyLight.home),
              activeIcon: Icon(IconlyBold.home),
              label: "Home",
            ),
            const BottomNavigationBarItem(
              icon: Icon(IconlyLight.search),
              activeIcon: Icon(IconlyBold.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  const Icon(
                    IconlyLight.paper,
                  ),
                  Positioned(
                    top: 0,
                    left: 8,
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                      child: const Center(
                        child: Text(
                          "1",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              activeIcon: Stack(
                children: [
                  const Icon(
                    IconlyBold.paper,
                  ),
                  Positioned(
                    top: 0,
                    left: 8,
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                      child: const Center(
                        child: Text(
                          "1",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              label: "List",
            ),
            const BottomNavigationBarItem(
              icon: Icon(IconlyLight.edit_square),
              activeIcon: Icon(IconlyBold.editSquare),
              label: "Calc",
            ),
            BottomNavigationBarItem(
              icon: Transform.rotate(
                angle: 225 * math.pi / 180,
                child: Icon(IconlyLight.voice_2),
              ),
              activeIcon: Transform.rotate(
                angle: 225 * math.pi / 180,
                child: const Icon(IconlyBold.voice_2),
              ),
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
      ),
    );
  }
}
