part of 'shopping_list_cubit.dart';

@freezed
class ShoppingListState with _$ShoppingListState {
  const factory ShoppingListState.initial() = _Initial;
  const factory ShoppingListState.loading() = _Loading;
  const factory ShoppingListState.failure(String message) = _Failure;
  const factory ShoppingListState.success(ShoppingList list) = _Success;
}
