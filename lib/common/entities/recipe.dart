// Package imports:
import 'package:build_shopping_list/common/entities/ingredient.dart';
import 'package:isar/isar.dart';

// Project imports:
// part 'recipe.freezed.dart';
part 'recipe.g.dart';

@collection
class Recipe {
  Recipe({
    required this.id,
    required this.name,
    required this.instructions,
    required this.ingredients,
  });

  Id? id; // you can also use id = null to auto increment

  @Index(type: IndexType.value)
  String? name;
  String? instructions;
  List<Ingredient>? ingredients;
}

//freezed example for use with rest api
// @freezed
// class Recipe with _$Recipe {
//   const Recipe._();

//   const factory Recipe({
//     required int id,
//     required String name,
//     String? desciption,
//     @Default([]) List<Ingredient> ingredients,
//   }) = _Recipe;

//   factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
// }
