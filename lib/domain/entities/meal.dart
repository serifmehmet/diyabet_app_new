import 'package:diyabet_app/domain/entities/consumption.dart';

class Meal {
  final int? mealId;
  final DateTime? mealDate;
  final double? bolusValue;
  final double? totalCarb;
  final List<Consumption>? consumptions;

  Meal({
    this.mealId,
    this.mealDate,
    this.bolusValue,
    this.totalCarb,
    this.consumptions,
  });
}
