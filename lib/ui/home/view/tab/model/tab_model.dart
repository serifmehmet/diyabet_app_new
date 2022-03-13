import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../home_view.dart';

class _TabModel {
  final Widget page;
  final IconData icon;

  _TabModel(this.page, {required this.icon});
}

class TabModels {
  late final List<_TabModel> tabItems;

  // TabModels.create() {
  //   tabItems = [
  //     _TabModel(
  //       const HomeView(),
  //       icon: IconlyLight.home,
  //     ),
  //     _TabModel(
  //       const SearchView(),
  //       icon: IconlyLight.search,
  //     ),
  //     _TabModel(
  //       const HomeView(),
  //       icon: IconlyLight.paper,
  //     ),
  //     _TabModel(
  //       const HomeView(),
  //       icon: IconlyLight.edit_square,
  //     ),
  //     _TabModel(
  //       const HomeView(),
  //       icon: IconlyLight.voice_2,
  //     ),
  //   ];
  // }
}
