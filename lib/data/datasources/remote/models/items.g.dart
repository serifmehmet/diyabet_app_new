// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsModel _$ItemsModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const [
      'sugar_g',
      'fiber_g',
      'serving_size_g',
      'sodium_mg',
      'name',
      'potassium_mg',
      'fat_saturated_g',
      'fat_total_g',
      'calories',
      'cholesterol_mg',
      'protein_g',
      'carbohydrates_total_g'
    ],
  );
  return ItemsModel(
    sugarG: (json['sugar_g'] as num?)?.toDouble(),
    fiberG: (json['fiber_g'] as num?)?.toDouble(),
    servingSizeG: (json['serving_size_g'] as num?)?.toDouble(),
    sodiumMg: json['sodium_mg'] as int?,
    name: json['name'] as String?,
    potassiumMg: json['potassium_mg'] as int?,
    fatSaturatedG: (json['fat_saturated_g'] as num?)?.toDouble(),
    fatTotalG: (json['fat_total_g'] as num?)?.toDouble(),
    calories: (json['calories'] as num?)?.toDouble(),
    cholesterolMg: json['cholesterol_mg'] as int?,
    proteinG: (json['protein_g'] as num?)?.toDouble(),
    carbohydratesTotalG: (json['carbohydrates_total_g'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$ItemsModelToJson(ItemsModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sugar_g', instance.sugarG);
  writeNotNull('fiber_g', instance.fiberG);
  writeNotNull('serving_size_g', instance.servingSizeG);
  writeNotNull('sodium_mg', instance.sodiumMg);
  writeNotNull('name', instance.name);
  writeNotNull('potassium_mg', instance.potassiumMg);
  writeNotNull('fat_saturated_g', instance.fatSaturatedG);
  writeNotNull('fat_total_g', instance.fatTotalG);
  writeNotNull('calories', instance.calories);
  writeNotNull('cholesterol_mg', instance.cholesterolMg);
  writeNotNull('protein_g', instance.proteinG);
  writeNotNull('carbohydrates_total_g', instance.carbohydratesTotalG);
  return val;
}
