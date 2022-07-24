import 'package:diyabet_app/domain/entities/user_bolus.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user_bolus_model.g.dart';

@JsonSerializable()
class UserBolusModel extends INetworkModel<UserBolusModel> {
  int? id;
  int? userId;
  double? calculatedBolusValue;
  double? totalCarbValue;
  DateTime? calculatedTime;

  UserBolusModel({
    this.id,
    this.userId,
    this.calculatedBolusValue,
    this.totalCarbValue,
    this.calculatedTime,
  });

  @override
  factory UserBolusModel.fromJson(Map<String, dynamic> json) {
    return _$UserBolusModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$UserBolusModelToJson(this);
  }

  UserBolus toEntity() => UserBolus(
        id: id,
        userId: userId,
        calculatedBolusValue: calculatedBolusValue,
        totalCarbValue: totalCarbValue,
        calculatedTime: calculatedTime,
      );

  @override
  UserBolusModel fromJson(Map<String, dynamic> json) {
    return UserBolusModel.fromJson(json);
  }
}
