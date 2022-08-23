import 'package:diyabet_app/core/base/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/remote/recipe_repository.dart';
import 'package:diyabet_app/domain/entities/recipe_root.dart';
import 'package:diyabet_app/domain/usecases/recipe/remote/params/get_recipe_by_user_id_params.dart';

class GetUserRemoteRecipeUseCase extends UseCaseWithFailure<RecipeRoot, GetRecipeByUserIdParams> {
  final RecipeRepository recipeRepository;

  GetUserRemoteRecipeUseCase({required this.recipeRepository});

  @override
  Future<Either<Failure, RecipeRoot>> call(GetRecipeByUserIdParams params) async {
    final recipeRoot = await recipeRepository.getRecipeByUserId(params.userId);

    return recipeRoot;
  }
}
