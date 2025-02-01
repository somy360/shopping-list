import 'package:build_shopping_list/common/cubit/weekly_menu_cubit.dart';
import 'package:build_shopping_list/common/entities/day.dart';
import 'package:build_shopping_list/common/entities/meal.dart';
import 'package:build_shopping_list/common/entities/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

//TODO: in the future we can add, times, servings, an image, descriptions to these cards
class SelectableRecipeCard extends StatelessWidget {
  const SelectableRecipeCard({
    super.key,
    required this.recipe,
    required this.meal,
    required this.day,
  });

  final Day day;
  final Meal meal;
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            //TODO: analyse if there is a better way to do this and structure this data
            context.read<WeeklyMenuCubit>().updateMenu(
                  day: day,
                  meal: meal,
                  recipeId: recipe.id!,
                );
            context.pop();
          },
          child: Ink(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      //TODO: use recase here
                      recipe.name!,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
