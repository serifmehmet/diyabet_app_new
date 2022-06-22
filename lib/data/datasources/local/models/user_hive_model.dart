import 'package:hive_flutter/hive_flutter.dart';
part 'user_hive_model.g.dart';

@HiveType(typeId: 3)
class UserHiveModel extends HiveObject {
  static const String boxKey = "userModel";

  @HiveField(0)
  late double id;
  @HiveField(1)
  late String fullName;
  @HiveField(2)
  late String email;
  @HiveField(3)
  late String errorCode;
}
