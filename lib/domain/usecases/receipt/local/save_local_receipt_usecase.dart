import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/local/local_receipt_repository.dart';
import 'package:diyabet_app/domain/usecases/receipt/params/save_receipt_params.dart';

class SaveLocalReceiptUseCase extends UseCase<void, SaveReceiptParams> {
  final LocalReceiptRepository localReceiptRepository;

  SaveLocalReceiptUseCase({required this.localReceiptRepository});

  @override
  Future<void> call(SaveReceiptParams params) async {
    await localReceiptRepository.saveLocalReceipt(params.localReceipt!.toHiveModel());
  }
}
