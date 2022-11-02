import 'package:diyabet_app/data/repositories/remote/food_repository.dart';
import 'package:diyabet_app/domain/entities/generic_response.dart';
import 'package:diyabet_app/domain/usecases/food/params/save_favorite_food_params.dart';

import '../../../core/init/usecase/usecase.dart';

class SaveFavoriteFoodUsecase extends UseCase<GenericResponse, SaveFavoriteFoodParams> {
  final FoodRepository foodRepository;

  SaveFavoriteFoodUsecase({required this.foodRepository});

  @override
  Future<GenericResponse> call(SaveFavoriteFoodParams params) async {
    final response = await foodRepository.saveFavoriteFood(params.foodId);

    return response!;
  }
}
