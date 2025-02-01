import 'package:build_shopping_list/app/localization/build_shopping_list_localizations.dart';
import 'package:build_shopping_list/common/entities/ingredient.dart';
import 'package:flutter/material.dart';

class IngredientRow extends StatefulWidget {
  const IngredientRow(
      {super.key, required this.ingredient, required this.updateIngredient});

  final Ingredient ingredient;
  final Function updateIngredient;

  @override
  State<IngredientRow> createState() => _IngredientRowState();
}

class _IngredientRowState extends State<IngredientRow> {
  late Ingredient _ingredient = widget.ingredient;
  late final TextEditingController nameController =
      TextEditingController(text: _ingredient.name);
  late final TextEditingController quantityController =
      TextEditingController(text: _ingredient.quantity.toString());
  late final TextEditingController unitController = TextEditingController(
    text: _ingredient.unit,
  );

  void _updateIngredient() {
    widget.updateIngredient(_ingredient);
  }

  Widget _nameTextField(String hintText) {
    return Expanded(
      flex: 3,
      child: TextField(
        controller: nameController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.labelSmall,
        ),
        onChanged: (value) {
          _ingredient = Ingredient(
              id: _ingredient.id,
              name: value,
              quantity: _ingredient.quantity,
              unit: _ingredient.unit);
          _updateIngredient();
        },
      ),
    );
  }

  Widget _quantityTextField(String hintText) {
    return Expanded(
      child: TextField(
        controller: quantityController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.labelSmall,
        ),
        onChanged: (value) {
          _ingredient = Ingredient(
              id: _ingredient.id,
              name: _ingredient.name,
              quantity: int.tryParse(value) ?? 0,
              unit: _ingredient.unit);
          _updateIngredient();
        },
      ),
    );
  }

  Widget _unitTextField(String hintText) {
    return Expanded(
      flex: 2,
      child: TextField(
        controller: unitController,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.labelSmall,
        ),
        onChanged: (value) {
          _ingredient = Ingredient(
              id: _ingredient.id,
              name: _ingredient.name,
              quantity: _ingredient.quantity,
              unit: value);
          _updateIngredient();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final translations =
        BuildShoppingListLocalizations.of(context).addRecipePage;
    return Row(
      children: [
        _nameTextField(translations.ingredientNameHint),
        const SizedBox(
          width: 20,
        ),
        _quantityTextField(translations.ingredientQuantityHint),
        const SizedBox(
          width: 20,
        ),
        _unitTextField(translations.ingredientUnitHint),
      ],
    );
  }
}
