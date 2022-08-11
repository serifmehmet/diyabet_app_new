class _FoodModel {
  final String name;
  final int id;

  _FoodModel({required this.name, required this.id});
}

class FoodModels {
  late final List<_FoodModel> foodItems;

  FoodModels.create() {
    foodItems = [
      _FoodModel(name: "Ekmek", id: 1),
      _FoodModel(name: "Pilav", id: 2),
      _FoodModel(name: "Makarna", id: 3),
      _FoodModel(name: "Badem", id: 4),
      _FoodModel(name: "Kıymalı Ispanak", id: 5),
      _FoodModel(name: "İmam bayılsı", id: 6),
      _FoodModel(name: "İmam bayılaı", id: 7),
      _FoodModel(name: "İmam bayılrı", id: 8),
      _FoodModel(name: "İmam bayıltı", id: 9),
      _FoodModel(name: "İmam bayılyı", id: 10),
    ];
  }
}
