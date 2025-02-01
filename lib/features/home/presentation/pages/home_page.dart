import 'package:build_shopping_list/app/localization/build_shopping_list_localizations.dart';
import 'package:build_shopping_list/common/cubit/weekly_menu_cubit.dart';
import 'package:build_shopping_list/features/home/presentation/widgets/home_page_cta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final translations = BuildShoppingListLocalizations.of(context).homePage;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                translations.welcome,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              HomePageCta(
                title: translations.weeksMenuButton,
                onPressed: () {
                  context.pushNamed('weekly-menu');
                },
              ),
              HomePageCta(
                title: translations.recipesButton,
                onPressed: () {
                  context.pushNamed('recipes-overview');
                },
              ),
              HomePageCta(
                title: translations.newShoppingListButton,
                onPressed: () {
                  context.read<WeeklyMenuCubit>().createMenu();
                  context.pushNamed('weekly-menu');
                },
              ),
              //add our logic / blocbuilder for fetching recent lists here
            ],
          ),
        ),
      ),
    );
  }
}
