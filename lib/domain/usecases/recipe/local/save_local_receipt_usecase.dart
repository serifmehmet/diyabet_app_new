// import 'package:diyabet_app/core/init/usecase/usecase.dart';
// import 'package:diyabet_app/data/repositories/local/local_receipt_repository.dart';
// import 'package:diyabet_app/domain/usecases/recipe/params/save_receipt_params.dart';

// class SaveLocalRecipeUseCase extends UseCase<void, SaveRecipeParams> {
//   final LocalReceiptRepository localReceiptRepository;

//   SaveLocalRecipeUseCase({required this.localReceiptRepository});

//   @override
//   Future<void> call(SaveRecipeParams params) async {
//     await localReceiptRepository.saveLocalReceipt(params.localReceipt!.toHiveModel());
//   }
// }
