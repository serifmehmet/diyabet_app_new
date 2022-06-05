import 'dart:core';

import 'package:diyabet_app/domain/entities/user_bolus.dart';

class User {
  final int? UserId;
  final String? FullName;
  final String? Email;
  final String? Password;
  final bool? IsForgotPassword;
  final String? ForgotPasswordGenCode;
  final DateTime? CreatedAt;
  final DateTime? UpdatedAt;
  final String? ErrorCode;
  final UserBolus? UserBls;

  User({
    this.UserId,
    this.FullName,
    this.Email,
    this.Password,
    this.IsForgotPassword,
    this.ForgotPasswordGenCode,
    this.CreatedAt,
    this.UpdatedAt,
    this.ErrorCode,
    this.UserBls,
  });

  // public virtual BolusCalcRecord[] BolusCalcRecords { get; set; }

  // public virtual UserBolus[] UserBoluses { get; set; }

}
