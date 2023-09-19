import 'package:dartz/dartz.dart';
import 'package:diyabet_app/core/base/error/app_exception.dart';
import 'package:diyabet_app/data/datasources/remote/recipe/recipe_remote_datasource.dart';
import 'package:diyabet_app/domain/entities/generic_response.dart';
import 'package:diyabet_app/domain/entities/recipe.dart';
import 'package:diyabet_app/domain/entities/recipe_root.dart';

import '../../../core/base/error/failure.dart';

abstract class RecipeRepository {
  Future<Either<Failure, GenericResponse>> addNewRecipe(Recipe recipe);
  Future<Either<Failure, RecipeRoot>> getRecipeByUserId(int userId);
  Future<Either<Failure, GenericResponse>> deleteRecipe(int recipeId, int userId);
}

class RecipeRepositoryImpl extends RecipeRepository {
  final RemoteRecipeDataSource remoteRecipeDataSource;

  RecipeRepositoryImpl({required this.remoteRecipeDataSource});

  @override
  Future<Either<Failure, GenericResponse>> addNewRecipe(Recipe recipe) async {
    try {
      final response = await remoteRecipeDataSource.addNewRecipe(recipe.toModel());

      return Right(response!.toEntity());
    } on UnAuthorized {
      return const Left(UnAuthorizedError());
    }
  }

  @override
  Future<Either<Failure, RecipeRoot>> getRecipeByUserId(int userId) async {
    try {
      final recipeResponse = await remoteRecipeDataSource.getRecipeByUserId(userId);

      final recipeRoot = recipeResponse!.toEntity();
      return Right(recipeRoot);
    } on UnAuthorized {
      return const Left(UnAuthorizedError());
    } on EmptyResponseError {
      return const Left(EmptyResponseError());
    }
  }

  @override
  Future<Either<Failure, GenericResponse>> deleteRecipe(int recipeId, int userId) async {
    try {
      final recipeResponse = await remoteRecipeDataSource.deleteRecipe(recipeId, userId);

      return Right(recipeResponse!.toEntity());
    } on UnAuthorized {
      return const Left(UnAuthorizedError());
    }
  }
}
