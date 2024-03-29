import 'dart:core';

import 'package:diyabet_app/data/datasources/remote/models/user/user_model.dart';
import 'package:diyabet_app/domain/entities/user_blood_target.dart';
import 'package:diyabet_app/domain/entities/user_bolus.dart';
import 'package:diyabet_app/domain/entities/user_idf.dart';
import 'package:diyabet_app/domain/entities/user_iko.dart';

class User {
  final int? UserId;
  final String? Name;
  final String? SurName;
  final String? Email;
  final String? Password;
  final bool? IsForgotPassword;
  final String? ForgotPasswordGenCode;
  final DateTime? CreatedAt;
  final DateTime? UpdatedAt;
  final String? ErrorCode;
  final String? ErrorDescription;
  final String? FcmRegistrationToken;
  final List<UserBolus>? UserBls;
  final List<UserIdf>? userIdfList;
  final List<UserIko>? userIkoList;
  final UserBloodTarget? userBloodTarget;

  final String? xSessionId;

  User({
    this.UserId,
    this.Name,
    this.SurName,
    this.Email,
    this.Password,
    this.IsForgotPassword,
    this.ForgotPasswordGenCode,
    this.CreatedAt,
    this.UpdatedAt,
    this.ErrorCode,
    this.ErrorDescription,
    this.FcmRegistrationToken,
    this.UserBls,
    this.userIdfList,
    this.userIkoList,
    this.userBloodTarget,
    this.xSessionId,
  });

  // public virtual BolusCalcRecord[] BolusCalcRecords { get; set; }

  // public virtual UserBolus[] UserBoluses { get; set; }
  UserModel toModel() => UserModel(
        userId: UserId,
        name: Name,
        surname: SurName,
        email: Email,
        password: Password,
        isPasswordForgot: IsForgotPassword,
        forgotPasswordGenCode: ForgotPasswordGenCode,
        createdAt: CreatedAt,
        updatedAt: UpdatedAt,
        errorCode: ErrorCode,
        fcmRegistrationToken: FcmRegistrationToken,
      );
}
