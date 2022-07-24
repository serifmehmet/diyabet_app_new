import '../../../entities/user_bolus.dart';

class SaveCalculatedUserBolusParams {
  final UserBolus? userBolus;
  final int? mealId;

  SaveCalculatedUserBolusParams({this.userBolus, this.mealId});
}
