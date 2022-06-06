// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_consumption_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodConsumptionModel _$FoodConsumptionModelFromJson(
        Map<String, dynamic> json) =>
    FoodConsumptionModel(
      id: json['Id'] as int?,
      foodList: (json['FoodList'] as List<dynamic>?)
          ?.map((e) =>
              FoodForFoodConsumptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createDate: json['CreateDate'] == null
          ? null
          : DateTime.parse(json['CreateDate'] as String),
      userId: json['UserId'] as int?,
    );

Map<String, dynamic> _$FoodConsumptionModelToJson(
    FoodConsumptionModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  val['FoodList'] = instance.foodList;
  val['CreateDate'] = instance.createDate?.toIso8601String();
  val['UserId'] = instance.userId;
  return val;
}
