// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userId: json['userId'] as int?,
      name: json['name'] as String? ?? '',
      surname: json['surname'] as String? ?? '',
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      isPasswordForgot: json['isPasswordForgot'] as bool? ?? false,
      forgotPasswordGenCode: json['forgotPasswordGenCode'] as String? ?? '',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      errorCode: json['errorCode'] as String? ?? '',
      errorDescription: json['errorDescription'] as String?,
      userBolusList: (json['userBolusList'] as List<dynamic>?)
          ?.map((e) => UserBolusModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      userIdfs: (json['userIdfs'] as List<dynamic>?)
          ?.map((e) => UserIdfModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      userIkos: (json['userIkos'] as List<dynamic>?)
          ?.map((e) => UserIkoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bloodTarget: json['bloodTarget'] == null
          ? null
          : UserBloodTargetModel.fromJson(
              json['bloodTarget'] as Map<String, dynamic>),
      fcmRegistrationToken: json['fcmRegistrationToken'] as String? ?? '',
      xSessionId: json['xSessionId'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'password': instance.password,
      'isPasswordForgot': instance.isPasswordForgot,
      'forgotPasswordGenCode': instance.forgotPasswordGenCode,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'errorCode': instance.errorCode,
      'userBolusList': instance.userBolusList,
      'userIdfs': instance.userIdfs,
      'userIkos': instance.userIkos,
      'bloodTarget': instance.bloodTarget,
      'errorDescription': instance.errorDescription,
      'fcmRegistrationToken': instance.fcmRegistrationToken,
      'xSessionId': instance.xSessionId,
    };
