import 'package:hive_flutter/hive_flutter.dart';

class LocalDataSource {
  static Future<void> initialize() async {
    await Hive.initFlutter();
  }
}
