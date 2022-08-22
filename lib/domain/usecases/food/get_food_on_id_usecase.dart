import '../../../core/init/usecase/usecase.dart';
import '../../../data/repositories/remote/food_repository.dart';
import '../../entities/remote_food_root.dart';
import 'params/get_food_param.dart';

class GetFoodOnIdUseCase extends UseCase<RemoteFoodRoot?, GetFoodParam> {
  final FoodRepository foodRepository;

  GetFoodOnIdUseCase({required this.foodRepository});

  @override
  Future<RemoteFoodRoot?> call(GetFoodParam params) {
    return foodRepository.getFoodById(params.foodId!);
  }
}
