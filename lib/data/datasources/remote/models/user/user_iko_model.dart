import 'package:diyabet_app/domain/entities/user_iko.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user_iko_model.g.dart';

@JsonSerializable()
class UserIkoModel extends INetworkModel<UserIkoModel> {
  int? id;
  int? userId;
  double? ikoValue;
  DateTime? hour;

  UserIkoModel({
    this.id,
    this.userId,
    this.ikoValue,
    this.hour,
  });

  @override
  factory UserIkoModel.fromJson(Map<String, dynamic> json) {
    return _$UserIkoModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$UserIkoModelToJson(this);
  }

  @override
  UserIkoModel fromJson(Map<String, dynamic> json) {
    return UserIkoModel.fromJson(json);
  }

  UserIko toEntity() => UserIko(
        id: id,
        userId: userId,
        hour: hour,
        ikoValue: ikoValue,
      );
}
