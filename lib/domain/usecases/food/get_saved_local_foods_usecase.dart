import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/local/local_food_repository.dart';
import 'package:diyabet_app/domain/entities/local_food.dart';

class GetSavedLocalFoodsUseCase extends UseCase<List<LocalFood?>, NoParams> {
  final LocalFoodRepository localFoodRepository;

  GetSavedLocalFoodsUseCase({required this.localFoodRepository});

  @override
  Future<List<LocalFood?>> call(NoParams params) async {
    return await localFoodRepository.getSavedFoodsFromLocal();
  }
}
