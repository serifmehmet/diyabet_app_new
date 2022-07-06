import 'package:diyabet_app/domain/entities/user_idf.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user_idf_model.g.dart';

@JsonSerializable()
class UserIdfModel extends INetworkModel<UserIdfModel> {
  int? id;
  DateTime? hour;
  double? idfValue;
  int? userId;

  UserIdfModel({
    this.id,
    this.hour,
    this.userId,
    this.idfValue,
  });

  @override
  factory UserIdfModel.fromJson(Map<String, dynamic> json) {
    return _$UserIdfModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$UserIdfModelToJson(this);
  }

  @override
  UserIdfModel fromJson(Map<String, dynamic> json) {
    return UserIdfModel.fromJson(json);
  }

  UserIdf toEntity() => UserIdf(
        id: id,
        userId: userId,
        idfValue: idfValue,
        hour: hour,
      );
}
