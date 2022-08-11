import 'package:diyabet_app/domain/entities/meal.dart';

class MealRoot {
  final String? errorCode;
  final String? errorDescription;
  final List<Meal>? meals;

  MealRoot({
    this.errorCode,
    this.errorDescription,
    this.meals,
  });
}
