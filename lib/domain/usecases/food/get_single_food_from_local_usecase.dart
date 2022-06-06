import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/local/local_food_repository.dart';
import 'package:diyabet_app/domain/entities/local_food.dart';
import 'package:diyabet_app/domain/usecases/food/params/get_food_param.dart';

class GetSingleFoodFromLocalUseCase extends UseCase<LocalFood?, GetFoodParam> {
  final LocalFoodRepository localFoodRepository;

  GetSingleFoodFromLocalUseCase({required this.localFoodRepository});

  @override
  Future<LocalFood?> call(GetFoodParam params) async {
    return await localFoodRepository.getSingleFood(params.foodIndex!);
  }
}
