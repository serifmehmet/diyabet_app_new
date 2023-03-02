import 'package:dartz/dartz.dart';
import 'package:diyabet_app/core/base/error/app_exception.dart';
import 'package:diyabet_app/core/base/error/failure.dart';
import 'package:diyabet_app/data/datasources/remote/recipe/recipe_unit_remote_datasource.dart';
import 'package:diyabet_app/domain/entities/recipe_unit_root.dart';

abstract class RecipeUnitRepository {
  Future<Either<Failure, RecipeUnitRoot>> getRecipeUnits();
}

class RecipeUnitRepositoryImpl extends RecipeUnitRepository {
  final RemoteRecipeUnitDataSource remoteRecipeUnitDataSource;

  RecipeUnitRepositoryImpl({required this.remoteRecipeUnitDataSource});

  @override
  Future<Either<Failure, RecipeUnitRoot>> getRecipeUnits() async {
    try {
      final response = await remoteRecipeUnitDataSource.getRecipeUnits();

      return Right(response!.toEntity());
    } on UnAuthorized {
      return const Left(UnAuthorizedError());
    }
  }
}
