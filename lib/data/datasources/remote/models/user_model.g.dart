// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      Id: (json['Id'] as num?)?.toDouble(),
      FullName: json['fullName'] as String?,
      Email: json['email'] as String?,
      Password: json['password'] as String?,
      IsForgotPassword: json['isForgotPassword'] as bool?,
      ForgotPasswordGenCode: json['forgotPasswordGenCode'] as String?,
      CreatedAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      UpdatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      ErrorCode: json['errorCode'] as String?,
      UserBlsModel: json['userBolus'] == null
          ? null
          : UserBolusModel.fromJson(json['userBolus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'Id': instance.Id,
      'fullName': instance.FullName,
      'email': instance.Email,
      'password': instance.Password,
      'isForgotPassword': instance.IsForgotPassword,
      'forgotPasswordGenCode': instance.ForgotPasswordGenCode,
      'createdAt': instance.CreatedAt?.toIso8601String(),
      'updatedAt': instance.UpdatedAt?.toIso8601String(),
      'errorCode': instance.ErrorCode,
      'userBolus': instance.UserBlsModel,
    };
