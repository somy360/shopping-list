import 'package:build_shopping_list/app/localization/build_shopping_list_localizations.dart';
import 'package:build_shopping_list/common/cubit/recipes_cubit.dart';
import 'package:build_shopping_list/common/entities/ingredient.dart';
import 'package:build_shopping_list/common/entities/recipe.dart';
import 'package:build_shopping_list/common/widget/simple_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipesOverviewPage extends StatefulWidget {
  const RecipesOverviewPage({super.key});

  @override
  State<RecipesOverviewPage> createState() => _RecipesOverviewPageState();
}

class _RecipesOverviewPageState extends State<RecipesOverviewPage> {
  @override
  Widget build(BuildContext context) {
    final translations =
        BuildShoppingListLocalizations.of(context).recipesOverviewPage;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
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
                          return Column(
                            children: [
                              for (var recipe in recipes.myRecipes)
                                RecipeCard(recipe: recipe),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  //TODO: show searchable list of created recipes
                  // const TextField(
                  //   decoration: InputDecoration(
                  //     labelText: 'Search Recipes',
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Container(
              height: 45,
              color: Theme.of(context).colorScheme.surface,
              child: SimpleAppBar(title: translations.title),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              height: 80,
              color: Theme.of(context).colorScheme.surface,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    context.pushNamed('add-recipe',
                        extra: Recipe(
                            id: null,
                            name: '',
                            instructions: '',
                            ingredients: [
                              Ingredient(id: 0, name: '', quantity: 1, unit: '')
                            ]));
                  },
                  child: Text(translations.createRecipeButton),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            recipe.name!,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          IconButton(
            onPressed: () {
              context.pushNamed('add-recipe', extra: recipe);
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
    ));
  }
}
