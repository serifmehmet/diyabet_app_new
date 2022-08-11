import 'package:diyabet_app/data/datasources/remote/models/meal/meal_model.dart';
import 'package:diyabet_app/domain/entities/meal_root.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'meal_root_model.g.dart';

@JsonSerializable()
class MealRootModel extends INetworkModel<MealRootModel> {
  String? errorCode;
  String? errorDescription;
  List<MealModel>? meals;

  MealRootModel({
    this.errorCode,
    this.errorDescription,
    this.meals,
  });

  @override
  factory MealRootModel.fromJson(Map<String, dynamic> json) {
    return _$MealRootModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$MealRootModelToJson(this);
  }

  @override
  MealRootModel fromJson(Map<String, dynamic> json) {
    return MealRootModel.fromJson(json);
  }

  MealRoot toEntity() => MealRoot(
        errorCode: errorCode,
        errorDescription: errorDescription,
        meals: meals!.map((e) => e.toEntity()).toList(),
      );
}
