// Package imports:
import 'package:isar/isar.dart';

// Project imports:
// part 'ingredient.freezed.dart';
part 'shopping_list_item.g.dart';

@embedded
class ShoppingListItem {
  ShoppingListItem(
      {this.id,
      this.name,
      this.quantity,
      this.unit,
      this.isChecked = false,
      this.displayName});

  int? id;
  String? name;
  int? quantity;
  String? unit;
  bool isChecked;
  String? displayName;

  ShoppingListItem copyWith({
    int? id,
    String? name,
    int? quantity,
    String? unit,
    bool? isChecked,
    String? displayName,
  }) {
    return ShoppingListItem(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      isChecked: isChecked ?? this.isChecked,
      displayName: displayName ?? this.displayName,
    );
  }
}
