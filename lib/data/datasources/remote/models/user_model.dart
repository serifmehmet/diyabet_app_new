import 'package:diyabet_app/data/datasources/remote/models/user_bolus_model.dart';
import 'package:diyabet_app/data/datasources/remote/models/user_bolus_model.dart';
import 'package:diyabet_app/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part "user_model.g.dart";

@JsonSerializable()
class UserModel extends INetworkModel<UserModel> {
  @JsonKey(name: "Id")
  double? Id;
  @JsonKey(name: "fullName")
  String? FullName;
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

  UserModel(
      {this.Id,
      this.FullName,
      this.Email,
      this.Password,
      this.IsForgotPassword,
      this.ForgotPasswordGenCode,
      this.CreatedAt,
      this.UpdatedAt,
      this.ErrorCode,
      this.UserBlsModel});

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
      Id: Id,
      FullName: FullName,
      Password: Password,
      IsForgotPassword: IsForgotPassword,
      UpdatedAt: UpdatedAt,
      ForgotPasswordGenCode: ForgotPasswordGenCode,
      ErrorCode: ErrorCode,
      UserBls: UserBlsModel!.toEntity());

  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return UserModel.fromJson(json);
  }
}
