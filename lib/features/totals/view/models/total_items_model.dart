class _TotalItemsModel {
  final String? itemName;
  final String? itemUnit;
  final double? totalCarb;

  _TotalItemsModel({this.itemName, this.itemUnit, this.totalCarb});
}

class TotalsModel {
  late final List<_TotalItemsModel> totalItems;

  TotalsModel.create() {
    totalItems = [
      _TotalItemsModel(itemName: "İmam Bayıldı", itemUnit: "1 Porsiyon", totalCarb: 16.63),
      _TotalItemsModel(itemName: "Havuç", itemUnit: "1 Adet", totalCarb: 1),
      _TotalItemsModel(itemName: "Beyaz Ekmek", itemUnit: "1 Dilim", totalCarb: 1.2)
    ];
  }

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
