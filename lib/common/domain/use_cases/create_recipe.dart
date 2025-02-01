// Package imports:
import 'package:build_shopping_list/common/data/recipe_repository.dart';
import 'package:build_shopping_list/common/entities/recipe.dart';
import 'package:build_shopping_list/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// Project imports:

@injectable
class CreateRecipe {
  final RecipeRepository repository;

  CreateRecipe(this.repository);

  Future<Either<Failure, Recipe>> call(Recipe recipe) =>
      repository.createRecipe(recipe);
}
