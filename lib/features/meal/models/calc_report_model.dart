class CalcItemModel {
  final String? repast;
  final double? totalCarb;
  final double? totalBolus;
  final List<_FoodItemModel>? foodsOnRepast;

  CalcItemModel({this.repast, this.totalCarb, this.totalBolus, this.foodsOnRepast});
}

class _FoodItemModel {
  final String? itemName;
  final String? itemUnit;
  final double? totalCarb;

  _FoodItemModel({this.itemName, this.itemUnit, this.totalCarb});
}

class CalculatedItemsModel {
  late final List<CalcItemModel> calcItems;

  CalculatedItemsModel.create() {
    calcItems = [
      CalcItemModel(
        repast: "09:45",
        totalCarb: 30,
        totalBolus: 1,
        foodsOnRepast: [
          _FoodItemModel(itemName: "Omlet", itemUnit: "1 Porsiyon", totalCarb: 12),
          _FoodItemModel(itemName: "Beyaz Peynir", itemUnit: "1 Adet", totalCarb: 2),
          _FoodItemModel(itemName: "Beyaz ekmek", itemUnit: "2 Dilim", totalCarb: 6),
        ],
      ),
      CalcItemModel(
        repast: "13:15",
        totalCarb: 20,
        totalBolus: 1,
        foodsOnRepast: [
          _FoodItemModel(itemName: "İmam Bayıldı", itemUnit: "1 Porsiyon", totalCarb: 20),
          _FoodItemModel(itemName: "Havuç", itemUnit: "1 Adet", totalCarb: 1),
          _FoodItemModel(itemName: "Beyaz ekmek", itemUnit: "1 Dilim", totalCarb: 1.2),
        ],
      ),
      CalcItemModel(
        repast: "19:32",
        totalCarb: 25,
        totalBolus: 1,
        foodsOnRepast: [
          _FoodItemModel(itemName: "Akdeniz Salata", itemUnit: "1 Porsiyon", totalCarb: 15),
          _FoodItemModel(itemName: "Tavuk Sote", itemUnit: "1 Porsiyon", totalCarb: 8),
          _FoodItemModel(itemName: "Beyaz ekmek", itemUnit: "1.5 Dilim", totalCarb: 2),
        ],
      ),
    ];
  }
}
