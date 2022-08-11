import 'package:diyabet_app/data/datasources/local/models/local_receipt_hive_model.dart';
import 'package:diyabet_app/data/datasources/local/receipt/local_receipt_datasource.dart';

abstract class LocalReceiptRepository {
  Future<void> saveLocalReceipt(LocalRecieptHiveModel receiptToSave);
}

class LocalReceiptRepositoryImpl extends LocalReceiptRepository {
  final LocalReceiptDataSource localReceiptDataSource;

  LocalReceiptRepositoryImpl({required this.localReceiptDataSource});

  @override
  Future<void> saveLocalReceipt(LocalRecieptHiveModel receiptToSave) async {
    await localReceiptDataSource.saveLocalReceipt(receiptToSave);
  }
}
