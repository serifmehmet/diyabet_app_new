// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericResponseModel _$GenericResponseModelFromJson(
        Map<String, dynamic> json) =>
    GenericResponseModel(
      errorCode: json['errorCode'] as String?,
      errorDescription: json['errorDescription'] as String?,
    );

Map<String, dynamic> _$GenericResponseModelToJson(
        GenericResponseModel instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorDescription': instance.errorDescription,
    };
