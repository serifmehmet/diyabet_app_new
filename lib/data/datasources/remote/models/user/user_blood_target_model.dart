import 'package:diyabet_app/domain/entities/user_blood_target.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user_blood_target_model.g.dart';

@JsonSerializable()
class UserBloodTargetModel extends INetworkModel<UserBloodTargetModel> {
  int? id;
  int? userId;

  ///Açlık Kan Şekeri
  double? fbstValue;

  ///Gece Açlık Kan Şekeri
  double? ofbgtValue;

  UserBloodTargetModel({this.id, this.userId, this.fbstValue, this.ofbgtValue});

  @override
  factory UserBloodTargetModel.fromJson(Map<String, dynamic> json) {
    return _$UserBloodTargetModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$UserBloodTargetModelToJson(this);
  }

  @override
  UserBloodTargetModel fromJson(Map<String, dynamic> json) {
    return UserBloodTargetModel.fromJson(json);
  }

  UserBloodTarget toEntity() => UserBloodTarget(id: id, userId: userId, fbstValue: fbstValue, ofbgtValue: ofbgtValue);
}
