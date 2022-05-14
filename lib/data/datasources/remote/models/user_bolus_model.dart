import 'package:diyabet_app/domain/entities/user_bolus.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user_bolus_model.g.dart';

@JsonSerializable()
class UserBolusModel extends INetworkModel<UserBolusModel> {
  double? Id;
  double? IdfValue;
  double? IkoValue;

  UserBolusModel({
    this.Id,
    this.IdfValue,
    this.IkoValue,
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
        Id: Id,
        IdfValue: IdfValue,
        IkoValue: IkoValue,
      );

  @override
  UserBolusModel fromJson(Map<String, dynamic> json) {
    return UserBolusModel.fromJson(json);
  }
}
