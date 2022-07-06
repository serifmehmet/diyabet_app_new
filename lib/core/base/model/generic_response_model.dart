import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'generic_response_model.g.dart';

@JsonSerializable()
class GenericResponseModel extends INetworkModel<GenericResponseModel> {
  String? errorCode;
  String? errorDescription;

  GenericResponseModel({this.errorCode, this.errorDescription});

  @override
  factory GenericResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GenericResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$GenericResponseModelToJson(this);
  }

  @override
  GenericResponseModel fromJson(Map<String, dynamic> json) {
    return GenericResponseModel.fromJson(json);
  }
}
