import 'package:build_shopping_list/app/localization/build_shopping_list_localizations.dart';
import 'package:build_shopping_list/common/cubit/recipes_cubit.dart';
import 'package:build_shopping_list/common/cubit/weekly_menu_cubit.dart';
import 'package:build_shopping_list/common/entities/day.dart';
import 'package:build_shopping_list/common/widget/simple_app_bar.dart';
import 'package:build_shopping_list/features/weekly-menu/presentation/widgets/menu_day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WeeklyMenuPage extends StatefulWidget {
  const WeeklyMenuPage({super.key});

  @override
  State<WeeklyMenuPage> createState() => _WeeklyMenuPageState();
}

class _WeeklyMenuPageState extends State<WeeklyMenuPage> {
  @override
  void initState() {
    context.read<RecipesCubit>().getRecipes();
    context.read<WeeklyMenuCubit>().getMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final translations =
        BuildShoppingListLocalizations.of(context).weeklyMenuPage;
    //create a bloc to fetch the current weekly menu from api, the state can be updated by setting the cubit
    //hitting the build shopping list button will update the API
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SimpleAppBar(title: translations.title),
              const SizedBox(
                height: 20,
              ),
              MenuDay(
                dayText: translations.monday,
                day: Day.monday,
              ),
              MenuDay(
                dayText: translations.tuesday,
                day: Day.tuesday,
              ),
              MenuDay(
                dayText: translations.wednesday,
                day: Day.wednesday,
              ),
              MenuDay(
                dayText: translations.thursday,
                day: Day.thursday,
              ),
              MenuDay(
                dayText: translations.friday,
                day: Day.friday,
              ),
              MenuDay(
                dayText: translations.saturday,
                day: Day.saturday,
              ),
              MenuDay(
                dayText: translations.sunday,
                day: Day.sunday,
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    context.pushNamed('shopping-list');
                  },
                  child: Text(translations.buildShoppingListButton),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
