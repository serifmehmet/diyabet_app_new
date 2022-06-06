import 'dart:collection';

import 'package:diyabet_app/features/bolus/view/bolus_view.dart';
import 'package:diyabet_app/features/meal/view/calc_report_view.dart';
import 'package:diyabet_app/features/home/cubit/bottom_nav_cubit.dart';
import 'package:diyabet_app/features/totals/cubit/totals_cubit.dart';
import 'package:diyabet_app/features/totals/view/totals_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final _items = [const HomeView(), SearchView(), TotalsView(), CalcReportView(), BolusView()];
  final ListQueue<int> _navigationQueue = ListQueue();

  void onTap(int index) {
    if (index != context.read<BottomNavCubit>().state) {
      _navigationQueue.removeWhere((element) => element == index);
      _navigationQueue.addLast(index);
    }
    context.read<BottomNavCubit>().updateSelectedIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            if (_navigationQueue.isEmpty) {
              return true;
            }

            setState(() {
              _navigationQueue.removeLast();
              int position = _navigationQueue.isEmpty ? 0 : _navigationQueue.last;
              context.read<BottomNavCubit>().updateSelectedIndex(position);
            });
            return false;
          },
          child: Scaffold(
            body: IndexedStack(
              index: context.read<BottomNavCubit>().state,
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
                      BlocBuilder<TotalsCubit, TotalsState>(
                        builder: (context, state) {
                          if (state is GetFoodsSuccess && state.foodCount > 0) {
                            return Positioned(
                              top: 0,
                              left: 8,
                              child: Container(
                                width: 15,
                                height: 15,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff1BC47D),
                                ),
                                child: Center(
                                  child: Text(
                                    state.foodCount.toString(),
                                    style: const TextStyle(fontSize: 10, color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          }

                          return SizedBox(width: 0, height: 0);
                        },
                      )
                    ],
                  ),
                  activeIcon: Stack(
                    children: [
                      const Icon(
                        IconlyBold.paper,
                      ),
                      BlocBuilder<TotalsCubit, TotalsState>(
                        builder: (context, state) {
                          if (state is GetFoodsSuccess && state.foodCount > 0) {
                            return Positioned(
                              top: 0,
                              left: 10,
                              child: Container(
                                width: 15,
                                height: 15,
                                decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xff1BC47D)),
                                child: Center(
                                  child: Text(
                                    state.foodCount.toString(),
                                    style: const TextStyle(fontSize: 10, color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          }

                          return SizedBox(width: 0, height: 0);
                        },
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
              currentIndex: context.read<BottomNavCubit>().state,
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
      },
    );
  }
}
