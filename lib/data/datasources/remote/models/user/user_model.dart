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

  String? name;

  String? sureName;

  String? email;

  String? password;

  bool? isPasswordForgot;

  String? forgotPasswordGenCode;

  DateTime? createdAt;

  DateTime? updatedAt;

  String? errorCode;

  List<UserBolusModel>? userBolusList;

  List<UserIdfModel>? userIdfs;

  List<UserIkoModel>? userIkos;

  UserBloodTargetModel? bloodTarget;

  String? errorDescription;

  String? fcmRegistrationToken;

  UserModel({
    this.userId,
    this.name,
    this.sureName,
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
        SureName: sureName,
        Password: password,
        IsForgotPassword: isPasswordForgot,
        UpdatedAt: updatedAt,
        ForgotPasswordGenCode: forgotPasswordGenCode,
        ErrorCode: errorCode,
        FcmRegistrationToken: fcmRegistrationToken,
        UserBls: userBolusList!.map((e) => e.toEntity()).toList(),
        userIdfList: userIdfs!.map((e) => e.toEntity()).toList(),
        userIkoList: userIkos!.map((e) => e.toEntity()).toList(),
        userBloodTarget: bloodTarget!.toEntity(),
      );
}
