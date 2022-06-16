import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import '../../../../domain/entities/user.dart';
import 'user_bolus_model.dart';

part "user_model.g.dart";

@JsonSerializable()
class UserModel extends INetworkModel<UserModel> {
  @JsonKey(name: "userId")
  int? UserId;
  @JsonKey(name: "name")
  String? Name;
  @JsonKey(name: "sureName")
  String? SureName;
  @JsonKey(name: "email")
  String? Email;
  @JsonKey(name: "password")
  String? Password;
  @JsonKey(name: "isForgotPassword")
  bool? IsForgotPassword;
  @JsonKey(name: "forgotPasswordGenCode")
  String? ForgotPasswordGenCode;
  @JsonKey(name: "createdAt")
  DateTime? CreatedAt;
  @JsonKey(name: "updatedAt")
  DateTime? UpdatedAt;
  @JsonKey(name: "errorCode")
  String? ErrorCode;
  @JsonKey(name: "userBolus")
  UserBolusModel? UserBlsModel;
  @JsonKey(name: "errorDescription")
  String? ErrorDescription;
  @JsonKey(name: "fcmRegistrationToken")
  String? FcmRegistrationToken;

  UserModel({
    this.UserId,
    this.Name,
    this.SureName,
    this.Email,
    this.Password,
    this.IsForgotPassword,
    this.ForgotPasswordGenCode,
    this.CreatedAt,
    this.UpdatedAt,
    this.ErrorCode,
    this.ErrorDescription,
    this.UserBlsModel,
    this.FcmRegistrationToken,
  });

  @override
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$UserModelToJson(this);
  }

  User toEntity() => User(
        CreatedAt: CreatedAt,
        Email: Email,
        UserId: UserId,
        Name: Name,
        SureName: SureName,
        Password: Password,
        IsForgotPassword: IsForgotPassword,
        UpdatedAt: UpdatedAt,
        ForgotPasswordGenCode: ForgotPasswordGenCode,
        ErrorCode: ErrorCode,
        FcmRegistrationToken: FcmRegistrationToken,
        UserBls: UserBlsModel!.toEntity(),
      );

  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return UserModel.fromJson(json);
  }
}
