import 'dart:developer';

import 'package:build_shopping_list/app/localization/build_shopping_list_localizations.dart';
import 'package:build_shopping_list/app/localization/translations.i69n.dart';
import 'package:build_shopping_list/common/cubit/recipes_cubit.dart';
import 'package:build_shopping_list/common/entities/ingredient.dart';
import 'package:build_shopping_list/common/entities/recipe.dart';
import 'package:build_shopping_list/common/widget/simple_app_bar.dart';
import 'package:build_shopping_list/features/recipes/presentation/cubit/create_recipe_cubit.dart';
import 'package:build_shopping_list/features/recipes/presentation/widgets/ingredient_row.dart';
import 'package:build_shopping_list/utils/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key, required this.recipe});

  final Recipe? recipe;

  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  List<Ingredient> ingredients = [];

  final TextEditingController _instructionsTextController =
      TextEditingController();

  final TextEditingController _recipeNameTextController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.recipe != null) {
      _recipeNameTextController.text = widget.recipe!.name ?? '';
      _instructionsTextController.text = widget.recipe!.instructions ?? '';
      ingredients = widget.recipe!.ingredients ?? [];
    }
  }

  Widget _addIngredientButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              ingredients.add(
                Ingredient(
                  id: (ingredients.length),
                  name: '',
                  quantity: 1,
                  unit: '',
                ),
              );
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.add_circle,
              size: 28,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _ingredients(AddRecipePageTranslations translations) {
    return Column(
      children: [
        Text(
          translations.ingredients,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                translations.ingredientName,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                translations.ingredientAmount,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 2,
              child: Text(
                translations.ingredientUnit,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
        for (Ingredient ingredient in ingredients)
          IngredientRow(
            ingredient: ingredient,
            updateIngredient: (Ingredient updatedIngredient) {
              log(ingredients.first.id.toString());
              log(updatedIngredient.id.toString());
              log('updated');
              int index = ingredients
                  .indexWhere((element) => element.id == updatedIngredient.id);
              setState(
                () {
                  ingredients[index] = updatedIngredient;
                },
              );
              log(ingredients.first.name.toString());
            },
          ),
      ],
    );
  }

  TextField _recipeInstructionsTextField(
      AddRecipePageTranslations translations) {
    return TextField(
      maxLines: 5,
      minLines: 2,
      controller: _instructionsTextController,
      decoration: InputDecoration(
        labelText: translations.instructions,
      ),
    );
  }

  TextField _recipeNameTextField(AddRecipePageTranslations translations) {
    return TextField(
      controller: _recipeNameTextController,
      decoration: InputDecoration(
        labelText: translations.recipeName,
      ),
    );
  }

  Align _bottomCta(
      BuildContext context, AddRecipePageTranslations translations) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 50,
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Center(
            child: ElevatedButton(
              onPressed: () async {
                showLoadingDialog(context, const Key('loadingDialog'));

                await GetIt.I<CreateRecipeCubit>()
                    .createRecipe(Recipe(
                        id: widget.recipe?.id,
                        name: _recipeNameTextController.text,
                        instructions: _instructionsTextController.text,
                        ingredients: ingredients))
                    .then((value) {
                  context.pop();
                  context.read<RecipesCubit>().getRecipes();
                  context.pop();
                });
              },
              child: Text(translations.saveRecipeButton),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AddRecipePageTranslations translations =
        BuildShoppingListLocalizations.of(context).addRecipePage;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SimpleAppBar(title: translations.title),
                  const SizedBox(
                    height: 20,
                  ),
                  _recipeNameTextField(translations),
                  const SizedBox(
                    height: 20,
                  ),
                  _recipeInstructionsTextField(translations),
                  const SizedBox(
                    height: 20,
                  ),
                  _ingredients(translations),
                  _addIngredientButton(),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
            _bottomCta(context, translations),
          ],
        ),
      )),
    );
  }
}
