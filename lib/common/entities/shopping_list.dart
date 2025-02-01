// Package imports:
import 'package:build_shopping_list/common/entities/shopping_list_item.dart';
import 'package:isar/isar.dart';

// Project imports:
// part 'recipe.freezed.dart';
part 'shopping_list.g.dart';

@collection
class ShoppingList {
  ShoppingList({
    required this.id,
    required this.items,
  });

  Id? id; // you can also use id = null to auto increment
  List<ShoppingListItem>? items;

  ShoppingList copyWith({
    Id? id,
    List<ShoppingListItem>? items,
  }) {
    return ShoppingList(
      id: id ?? this.id,
      items: items ?? this.items,
    );
  }
}
