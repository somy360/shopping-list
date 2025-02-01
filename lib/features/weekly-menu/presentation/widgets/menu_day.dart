import 'package:build_shopping_list/app/localization/build_shopping_list_localizations.dart';
import 'package:build_shopping_list/app/localization/translations.i69n.dart';
import 'package:build_shopping_list/common/cubit/recipes_cubit.dart';
import 'package:build_shopping_list/common/cubit/weekly_menu_cubit.dart';
import 'package:build_shopping_list/common/entities/day.dart';
import 'package:build_shopping_list/common/entities/meal.dart';
import 'package:build_shopping_list/common/entities/weekly_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MenuDay extends StatefulWidget {
  const MenuDay({
    super.key,
    required this.day,
    required this.dayText,
  });
  final Day day;
  final String dayText;

  @override
  State<MenuDay> createState() => _MenuDayState();
}

class _MenuDayState extends State<MenuDay> {
  late final Day _day = widget.day;

  bool _isRecipeIdSelected(WeeklyMenu? menu, Meal mealType) {
    if (menu == null) return false;

    final dailyMenu = menu.days?.singleWhere((element) => element.name == _day);
    if (dailyMenu == null) return false;

    switch (mealType) {
      case Meal.breakfast:
        return dailyMenu.breakfastRecipeId != null;
      case Meal.lunch:
        return dailyMenu.lunchRecipeId != null;
      case Meal.dinner:
        return dailyMenu.dinnerRecipeId != null;
    }
  }

  String _recipeName(WeeklyMenu? menu, Meal mealType) {
    return context.read<RecipesCubit>().state.maybeMap(
          orElse: () => '',
          success: (value) {
            final dailyMenu =
                menu?.days?.singleWhere((element) => element.name == _day);
            if (dailyMenu == null) return '';

            int? recipeId;
            switch (mealType) {
              case Meal.breakfast:
                recipeId = dailyMenu.breakfastRecipeId;
                break;
              case Meal.lunch:
                recipeId = dailyMenu.lunchRecipeId;
                break;
              case Meal.dinner:
                recipeId = dailyMenu.dinnerRecipeId;
                break;
            }

            return value.myRecipes
                    .firstWhere((element) => element.id == recipeId)
                    .name ??
                '';
          },
        );
  }

  Widget _mealRow(
      WeeklyMenu? menu, Meal mealType, String mealName, double spacing) {
    return Row(
      children: [
        Text('$mealName: '),
        SizedBox(width: spacing),
        if (_isRecipeIdSelected(menu, mealType))
          SizedBox(
            height: 40,
            child: Center(child: Text(_recipeName(menu, mealType))),
          )
        else
          AddRecipeButton(
            day: _day,
            meal: mealType,
          ),
      ],
    );
  }

  Widget _weeklyMenu(
      WeeklyMenuPageTranslations translations, WeeklyMenu? menu) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 150,
              child: Text(
                widget.dayText,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _mealRow(menu, Meal.breakfast, translations.breakfast, 20),
                _mealRow(menu, Meal.lunch, translations.lunch, 43),
                _mealRow(menu, Meal.dinner, translations.dinner, 40),
              ],
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final translations =
        BuildShoppingListLocalizations.of(context).weeklyMenuPage;
    return BlocBuilder<WeeklyMenuCubit, WeeklyMenuState>(
        builder: (context, state) {
      return state.maybeMap(
        orElse: () {
          return _weeklyMenu(translations, null);
        },
        success: (value) {
          return _weeklyMenu(translations, value.menu);
        },
      );
    });
  }
}

class AddRecipeButton extends StatelessWidget {
  const AddRecipeButton({super.key, required this.meal, required this.day});

  final Day day;
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.add_circle,
        color: Theme.of(context).colorScheme.tertiary,
      ),
      onPressed: () {
        context.pushNamed(
          'select-recipe',
          pathParameters: {
            'day': day.toString().split('.').last, // Convert enum to string
            'meal': meal.toString().split('.').last, // Convert enum to string
          },
        );
      },
    );
  }
}
