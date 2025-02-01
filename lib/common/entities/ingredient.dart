// Package imports:
import 'package:isar/isar.dart';

// Project imports:
// part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

@embedded
class Ingredient {
  //TODO: should we use the same id strategy as with Recipe? will it work with embedded
  Ingredient({
    this.id,
    this.name,
    this.quantity,
    this.unit,
  });

  int? id;
  String? name;
  int? quantity;
  String? unit;
}


// @freezed
// class Ingredient with _$Ingredient {
//   const Ingredient._();

//   const factory Ingredient({
//     required int id,
//     required String name,
//     required int quantity,
//     required String unit,
//   }) = _Ingredient;

//   factory Ingredient.fromJson(Map<String, dynamic> json) =>
//       _$IngredientFromJson(json);
// }
