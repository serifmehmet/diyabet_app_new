import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/local/local_food_repository.dart';

class DeleteAllFoodsUseCase extends UseCase<void, NoParams> {
  final LocalFoodRepository localFoodRepository;

  DeleteAllFoodsUseCase({required this.localFoodRepository});

  @override
  Future<void> call(NoParams params) async {
    await localFoodRepository.deleteAllFoods();
  }
}
