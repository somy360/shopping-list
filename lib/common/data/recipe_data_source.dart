// Package imports:
import 'package:build_shopping_list/common/entities/recipe.dart';
import 'package:build_shopping_list/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:isar/isar.dart';

class RecipeDataSource {
  Future<Either<Failure, Recipe>> createRecipe(Recipe recipe) async {
    try {
      final isar = Isar.getInstance();

      if (isar == null) {
        return const Left(Failure('database not initialized'));
      }

      await isar.writeTxn(() async {
        await isar.recipes.put(recipe);
      });
      return Right(recipe);
    } catch (e) {
      return const Left(Failure('Error creating recipe'));
    }
  }

  Future<Either<Failure, List<Recipe>>> getRecipes() async {
    try {
      final isar = Isar.getInstance();

      if (isar == null) {
        return const Left(Failure('database not initialized'));
      }

      final recipes = await isar.recipes.where().findAll();

      return Right(recipes);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
