import 'dart:core';

import 'package:diyabet_app/data/datasources/remote/models/user_model.dart';
import 'package:diyabet_app/domain/entities/user_bolus.dart';

class User {
  final int? UserId;
  final String? Name;
  final String? SureName;
  final String? Email;
  final String? Password;
  final bool? IsForgotPassword;
  final String? ForgotPasswordGenCode;
  final DateTime? CreatedAt;
  final DateTime? UpdatedAt;
  final String? ErrorCode;
  final String? ErrorDescription;
  final String? FcmRegistrationToken;
  final UserBolus? UserBls;

  User({
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
    this.FcmRegistrationToken,
    this.UserBls,
  });

  // public virtual BolusCalcRecord[] BolusCalcRecords { get; set; }

  // public virtual UserBolus[] UserBoluses { get; set; }
  UserModel toModel() => UserModel(
        UserId: UserId,
        Name: Name,
        SureName: SureName,
        Email: Email,
        Password: Password,
        IsForgotPassword: IsForgotPassword,
        ForgotPasswordGenCode: ForgotPasswordGenCode,
        CreatedAt: CreatedAt,
        UpdatedAt: UpdatedAt,
        ErrorCode: ErrorCode,
      );
}
