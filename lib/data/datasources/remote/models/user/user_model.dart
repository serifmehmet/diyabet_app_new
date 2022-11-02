import 'package:diyabet_app/data/datasources/remote/models/user/user_blood_target_model.dart';
import 'package:diyabet_app/data/datasources/remote/models/user/user_idf_model.dart';
import 'package:diyabet_app/data/datasources/remote/models/user/user_iko_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import '../../../../../domain/entities/user.dart';

import 'user_bolus_model.dart';

part "user_model.g.dart";

@JsonSerializable()
class UserModel extends INetworkModel<UserModel> {
  int? userId;

  @JsonKey(defaultValue: "")
  String? name;

  @JsonKey(defaultValue: "")
  String? surname;

  @JsonKey(defaultValue: "")
  String? email;

  @JsonKey(defaultValue: "")
  String? password;

  @JsonKey(defaultValue: false)
  bool? isPasswordForgot;

  @JsonKey(defaultValue: "")
  String? forgotPasswordGenCode;

  DateTime? createdAt;

  DateTime? updatedAt;

  @JsonKey(defaultValue: "")
  String? errorCode;

  @JsonKey(defaultValue: [])
  List<UserBolusModel>? userBolusList;

  @JsonKey(defaultValue: [])
  List<UserIdfModel>? userIdfs;

  @JsonKey(defaultValue: [])
  List<UserIkoModel>? userIkos;

  UserBloodTargetModel? bloodTarget;

  String? errorDescription;

  @JsonKey(defaultValue: "")
  String? fcmRegistrationToken;

  String? xSessionId;

  UserModel({
    this.userId,
    this.name,
    this.surname,
    this.email,
    this.password,
    this.isPasswordForgot,
    this.forgotPasswordGenCode,
    this.createdAt,
    this.updatedAt,
    this.errorCode,
    this.errorDescription,
    this.userBolusList,
    this.userIdfs,
    this.userIkos,
    this.bloodTarget,
    this.fcmRegistrationToken,
    this.xSessionId,
  });

  @override
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$UserModelToJson(this);
  }

  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return UserModel.fromJson(json);
  }

  User toEntity() => User(
        CreatedAt: createdAt,
        Email: email,
        UserId: userId,
        Name: name,
        SurName: surname,
        Password: password,
        IsForgotPassword: isPasswordForgot,
        UpdatedAt: updatedAt,
        ForgotPasswordGenCode: forgotPasswordGenCode,
        ErrorCode: errorCode,
        FcmRegistrationToken: fcmRegistrationToken,
        UserBls: userBolusList != null ? userBolusList!.map((e) => e.toEntity()).toList() : null,
        userIdfList: userIdfs != null ? userIdfs!.map((e) => e.toEntity()).toList() : null,
        userIkoList: userIkos != null ? userIkos!.map((e) => e.toEntity()).toList() : null,
        userBloodTarget: bloodTarget != null ? bloodTarget!.toEntity() : null,
        xSessionId: xSessionId,
      );
}
