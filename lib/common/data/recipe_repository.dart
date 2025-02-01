import 'package:build_shopping_list/common/data/recipe_data_source.dart';
import 'package:build_shopping_list/common/entities/recipe.dart';
import 'package:build_shopping_list/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class RecipeRepository {
  final RecipeDataSource _dataSource = RecipeDataSource();

  Future<Either<Failure, Recipe>> createRecipe(Recipe recipe) =>
      _dataSource.createRecipe(recipe);
  Future<Either<Failure, List<Recipe>>> getRecipes() =>
      _dataSource.getRecipes();
}
