// Package imports:
import 'package:build_shopping_list/common/data/recipe_repository.dart';
import 'package:build_shopping_list/common/entities/recipe.dart';
import 'package:build_shopping_list/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// Project imports:

@injectable
class GetRecipes {
  final RecipeRepository repository;

  GetRecipes(this.repository);

  Future<Either<Failure, List<Recipe>>> call() => repository.getRecipes();
}
