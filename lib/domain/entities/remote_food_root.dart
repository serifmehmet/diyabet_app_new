import 'package:diyabet_app/domain/entities/remote_food.dart';
import 'package:diyabet_app/domain/entities/remote_food_unit.dart';

class RemoteFoodRoot {
  final RemoteFood? Food;
  final List<RemoteFoodUnit>? FoodUnits;
  final String? ErrorCode;

  RemoteFoodRoot({
    this.Food,
    this.FoodUnits,
    this.ErrorCode,
  });
}
