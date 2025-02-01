// Package imports:
import 'package:isar/isar.dart';

// Project imports:
// part 'ingredient.freezed.dart';
part 'shopping_list_item.g.dart';

@embedded
class ShoppingListItem {
  ShoppingListItem({
    this.id,
    this.name,
    this.quantity,
    this.unit,
    this.isChecked = false,
  });

  int? id;
  String? name;
  int? quantity;
  String? unit;
  bool isChecked;

  ShoppingListItem copyWith({
    int? id,
    String? name,
    int? quantity,
    String? unit,
    bool? isChecked,
  }) {
    return ShoppingListItem(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}
