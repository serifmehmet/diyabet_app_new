import 'package:dartz/dartz.dart';
import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/remote/recipe_unit_repository.dart';
import 'package:diyabet_app/domain/entities/recipe_unit_root.dart';

import '../../../core/base/error/failure.dart';

class GetRecipeUnitsUseCase extends UseCase<Either<Failure, RecipeUnitRoot>, NoParams> {
  final RecipeUnitRepository recipeUnitRepository;

  GetRecipeUnitsUseCase({required this.recipeUnitRepository});

  @override
  Future<Either<Failure, RecipeUnitRoot>> call(NoParams params) {
    return recipeUnitRepository.getRecipeUnits();
  }
}
