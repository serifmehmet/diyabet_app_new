import 'package:diyabet_app/domain/entities/remote_food.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'remote_food_model.g.dart';

@JsonSerializable()
class RemoteFoodModel extends INetworkModel<RemoteFoodModel> {
  int? id;
  String? name;
  bool? showInSearch;

  RemoteFoodModel({
    this.id,
    this.name,
    this.showInSearch,
  });

  @override
  factory RemoteFoodModel.fromJson(Map<String, dynamic> json) {
    return _$RemoteFoodModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$RemoteFoodModelToJson(this);
  }

  @override
  RemoteFoodModel fromJson(Map<String, dynamic> json) {
    return RemoteFoodModel.fromJson(json);
  }

  RemoteFood toEntity() => RemoteFood(
        Id: id,
        Name: name,
        ShowInSearch: showInSearch,
      );
}
