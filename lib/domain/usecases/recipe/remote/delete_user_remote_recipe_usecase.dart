import 'package:diyabet_app/core/base/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:diyabet_app/data/repositories/remote/recipe_repository.dart';
import 'package:diyabet_app/domain/usecases/recipe/remote/params/delete_recipe_params.dart';

import '../../../../core/init/usecase/usecase.dart';
import '../../../entities/generic_response.dart';

class DeleteUserRemoteRecipeUseCase extends UseCaseWithFailure<GenericResponse, DeleteRecipeParams> {
  final RecipeRepository _repository;

  DeleteUserRemoteRecipeUseCase({required RecipeRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, GenericResponse>> call(DeleteRecipeParams params) async {
    final deleteResponse = await _repository.deleteRecipe(params.recipeId!, params.userId!);

    return deleteResponse;
  }
}
