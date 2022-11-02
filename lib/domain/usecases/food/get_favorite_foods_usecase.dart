import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/remote/food_repository.dart';
import 'package:diyabet_app/domain/entities/favorite_food_root.dart';

class GetFavoriteFoodsUsecase extends UseCase<FavoriteFoodRoot, NoParams> {
  final FoodRepository foodRepository;

  GetFavoriteFoodsUsecase({required this.foodRepository});

  @override
  Future<FavoriteFoodRoot> call(NoParams params) async {
    final response = await foodRepository.getFavoriteFoods();

    return response;
  }
}
