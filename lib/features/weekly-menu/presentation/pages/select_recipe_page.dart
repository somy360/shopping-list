import 'package:build_shopping_list/app/localization/build_shopping_list_localizations.dart';
import 'package:build_shopping_list/common/cubit/recipes_cubit.dart';
import 'package:build_shopping_list/common/entities/day.dart';
import 'package:build_shopping_list/common/entities/meal.dart';
import 'package:build_shopping_list/common/widget/simple_app_bar.dart';
import 'package:build_shopping_list/features/weekly-menu/presentation/widgets/selectable_recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectRecipePage extends StatefulWidget {
  const SelectRecipePage({
    super.key,
    required this.meal,
    required this.day,
  });
  final Meal meal;
  final Day day;

  @override
  State<SelectRecipePage> createState() => _SelectRecipePageState();
}

class _SelectRecipePageState extends State<SelectRecipePage> {
  @override
  Widget build(BuildContext context) {
    final translations =
        BuildShoppingListLocalizations.of(context).selectRecipesPage;
    //fetch recipes from cubit connected to api, in the meantime connect api to local
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SimpleAppBar(title: translations.title),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<RecipesCubit, RecipesState>(
                bloc: context.read<RecipesCubit>()..getRecipes(),
                builder: (context, state) {
                  return state.maybeMap(
                    orElse: () =>
                        const Center(child: CircularProgressIndicator()),
                    failure: (value) {
                      return Text(value.message);
                    },
                    success: (recipes) {
                      if (recipes.myRecipes.isEmpty) {
                        return Center(
                          child: Text(translations.noRecipes),
                        );
                      }
                      return Column(
                        children: [
                          for (var recipe in recipes.myRecipes)
                            SelectableRecipeCard(
                              recipe: recipe,
                              meal: widget.meal,
                              day: widget.day,
                            ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
