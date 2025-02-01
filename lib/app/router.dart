import 'package:build_shopping_list/common/entities/day.dart';
import 'package:build_shopping_list/common/entities/meal.dart';
import 'package:build_shopping_list/common/entities/recipe.dart';
import 'package:build_shopping_list/features/home/presentation/pages/home_page.dart';
import 'package:build_shopping_list/features/recipes/presentation/pages/add_recipe_page.dart';
import 'package:build_shopping_list/features/recipes/presentation/pages/recipes_overview_page.dart';
import 'package:build_shopping_list/features/shopping-list/presentation/shopping_list_page.dart';
import 'package:build_shopping_list/features/weekly-menu/presentation/pages/select_recipe_page.dart';
import 'package:build_shopping_list/features/weekly-menu/presentation/pages/weekly_menu_page.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name:
          'home', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name:
          'weekly-menu', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/weekly-menu',
      builder: (context, state) => const WeeklyMenuPage(),
    ),
    GoRoute(
      name:
          'select-recipe', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/select-recipe/:day/:meal',
      builder: (context, state) {
        final day = Day.values.firstWhere(
            (e) => e.toString().split('.').last == state.pathParameters['day']);
        final meal = Meal.values.firstWhere((e) =>
            e.toString().split('.').last == state.pathParameters['meal']);
        return SelectRecipePage(day: day, meal: meal);
      },
    ),
    GoRoute(
      name:
          'add-recipe', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/add-recipe',
      builder: (context, state) {
        final Recipe recipe = state.extra as Recipe;
        return AddRecipePage(recipe: recipe);
      },
    ),
    GoRoute(
      name:
          'recipes-overview', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/recipes-overview',
      builder: (context, state) => const RecipesOverviewPage(),
    ),
    GoRoute(
      name:
          'shopping-list', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/shopping-list',
      builder: (context, state) => const ShooppingListPage(),
    ),
    // GoRoute(
    //   name: 'shope',
    //   path: '/shope',
    //   builder: (context, state) => ShopeScreen(),
    // ),
  ],
);
