import 'package:bloc/bloc.dart';
import 'package:build_shopping_list/common/cubit/recipes_cubit.dart';
import 'package:build_shopping_list/common/cubit/weekly_menu_cubit.dart';
import 'package:build_shopping_list/common/entities/recipe.dart';
import 'package:build_shopping_list/common/entities/shopping_list.dart';
import 'package:build_shopping_list/common/entities/shopping_list_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'shopping_list_state.dart';
part 'shopping_list_cubit.freezed.dart';

@injectable
class ShoppingListCubit extends Cubit<ShoppingListState> {
  ShoppingListCubit() : super(const ShoppingListState.initial());

  final ShoppingList _shoppingList = ShoppingList(id: null, items: []);

  //TODO: we could use AI here to combine items in the list and sort the list by supermarket department
  Future<void> buildShoppingList(
      RecipesCubit recipeCubit, WeeklyMenuCubit weeklyMenuCubit) async {
    emit(const ShoppingListState.loading());
    List<Recipe> recipes = _getAllRecipesInMenu(recipeCubit, weeklyMenuCubit);

    print('testing + ' + recipes.length.toString());
    for (var recipe in recipes) {
      for (var ingredient in recipe.ingredients!) {
        if (_shoppingList.items!.any((element) =>
            element.name == ingredient.name &&
            element.unit == ingredient.unit)) {
          //todo: fix adding to quantity3
          int itemIndex = _shoppingList.items!.indexWhere((element) =>
              element.name == ingredient.name &&
              element.unit == ingredient.unit);
          ShoppingListItem item = _shoppingList.items![itemIndex];
          int quantity = (item.quantity ?? 0) + (ingredient.quantity ?? 0);
          print('testing4 ' + quantity.toString());

          String shoppingListItemName =
              '${ingredient.name!}${quantity == 0 ? '' : ' ($quantity '}${ingredient.unit == '' ? '' : '${ingredient.unit})'}';

          _shoppingList.items?.removeAt(itemIndex);
          _shoppingList.items!.add(ShoppingListItem(
            id: item.id,
            displayName: shoppingListItemName,
            name: item.name,
            quantity: quantity,
            unit: ingredient.unit,
          ));
        } else {
          String shoppingListItemName =
              '${ingredient.name!}${ingredient.quantity == 0 ? '' : ' (${ingredient.quantity} '}${ingredient.unit == '' ? '' : '${ingredient.unit})'}';

          _shoppingList.items!.add(ShoppingListItem(
            id: _shoppingList.items!.length,
            displayName: shoppingListItemName,
            name: ingredient.name,
            quantity: ingredient.quantity,
            unit: ingredient.unit,
          ));
        }
        // _shoppingList.items!.add(ShoppingListItem(
        //   id: _shoppingList.items!.length,
        //   name: ingredient.name,
        //   quantity: ingredient.quantity,
        //   unit: ingredient.unit,
        // ));
      }
    }
    print('testing2 + ' + _shoppingList.items!.length.toString());

    // _shoppingList.items!.add(
    //     ShoppingListItem(id: null, name: 'Milk', quantity: 100, unit: 'ml'));
    emit(ShoppingListState.success(_shoppingList));
  }

  Future<void> updateItem(
      {required ShoppingListItem item, bool emitStates = true}) async {
    if (emitStates) {
      emit(const ShoppingListState.loading());
    }
    print(item.id.toString());
    int index =
        _shoppingList.items!.indexWhere((element) => element.id == item.id);
    List<ShoppingListItem> items = _shoppingList.items!;
    items[index] = item;
    if (emitStates) {
      emit(ShoppingListState.success(_shoppingList.copyWith(items: items)));
    }
  }

  Future<void> reorderItems(int oldIndex, int newIndex) async {
    emit(const ShoppingListState.loading());
    final item = _shoppingList.items!.removeAt(oldIndex);
    // if (_shoppingList.items!.length > newIndex) {
    //   _shoppingList.items!.insert(newIndex, item);
    // } else {
    //   _shoppingList.items!.add(item);
    // }
    if (newIndex > _shoppingList.items!.length) {
      _shoppingList.items!.insert(newIndex - 1, item);
    } else {
      _shoppingList.items!.insert(newIndex, item);
    }
    emit(ShoppingListState.success(_shoppingList));
  }

  List<Recipe> _getAllRecipesInMenu(
      RecipesCubit recipeCubit, WeeklyMenuCubit weeklyMenuCubit) {
    // Fetch the weekly menu state
    final weeklyMenuState = weeklyMenuCubit.state;
    List<int> recipeIds = [];

    // Extract recipe IDs from the weekly menu
    weeklyMenuState.maybeMap(
      orElse: () {},
      success: (value) {
        final weeklyMenu = value.menu;
        for (var dailyMenu in weeklyMenu.days ?? []) {
          if (dailyMenu.breakfastRecipeId != null) {
            recipeIds.add(dailyMenu.breakfastRecipeId!);
          }
          if (dailyMenu.lunchRecipeId != null) {
            recipeIds.add(dailyMenu.lunchRecipeId!);
          }
          if (dailyMenu.dinnerRecipeId != null) {
            recipeIds.add(dailyMenu.dinnerRecipeId!);
          }
        }
      },
    );

    // Fetch recipes from the recipes cubit
    final recipesState = recipeCubit.state;
    List<Recipe> recipes = [];

    recipesState.maybeMap(
      orElse: () => [],
      success: (value) {
        for (var id in recipeIds) {
          recipes
              .add(value.myRecipes.firstWhere((element) => element.id == id));
        }
      },
    );

    return recipes;
  }
}
