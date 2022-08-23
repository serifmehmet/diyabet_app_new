import 'package:diyabet_app/core/base/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/data/repositories/remote/recipe_repository.dart';
import 'package:diyabet_app/domain/entities/generic_response.dart';
import 'package:diyabet_app/domain/usecases/recipe/remote/params/save_remote_recipe_params.dart';

class SaveRemoteRecipeUseCase extends UseCaseWithFailure<GenericResponse, SaveRemoteRecipeParams> {
  final RecipeRepository recipeRepository;

  SaveRemoteRecipeUseCase({required this.recipeRepository});

  @override
  Future<Either<Failure, GenericResponse>> call(SaveRemoteRecipeParams params) async {
    final saveResponse = await recipeRepository.addNewRecipe(params.recipeEntity);

    return saveResponse;
  }
}
