import 'package:equatable/equatable.dart';

class RemoteFoodUnit extends Equatable {
  final int? Id;
  final String? UnitName;
  final double? CarbValue;
  final int? FoodId;
  final int? UnitId;

  const RemoteFoodUnit({
    this.Id,
    this.UnitName,
    this.CarbValue,
    this.FoodId,
    this.UnitId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [Id, UnitName, CarbValue];
}
