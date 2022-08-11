import 'package:diyabet_app/data/datasources/local/models/local_receipt_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalReceiptDataSource {
  Future<void> saveLocalReceipt(LocalRecieptHiveModel receiptToSave) async {
    final receiptBox = Hive.box<LocalRecieptHiveModel>(LocalRecieptHiveModel.boxKey);

    await receiptBox.add(receiptToSave);
  }
}
