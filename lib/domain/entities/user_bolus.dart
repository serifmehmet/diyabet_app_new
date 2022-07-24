import '../../data/datasources/remote/models/user/user_bolus_model.dart';

class UserBolus {
  final int? id;
  final int? userId;
  final double? calculatedBolusValue;
  final double? totalCarbValue;
  final DateTime? calculatedTime;

  UserBolus({
    this.id,
    this.userId,
    this.calculatedBolusValue,
    this.calculatedTime,
    this.totalCarbValue,
  });

  UserBolusModel toRemoteModel() => UserBolusModel(
        id: id,
        userId: userId,
        calculatedBolusValue: calculatedBolusValue,
        totalCarbValue: totalCarbValue,
        calculatedTime: calculatedTime,
      );
}
