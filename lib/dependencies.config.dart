// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:build_shopping_list/common/cubit/recipes_cubit.dart' as _i690;
import 'package:build_shopping_list/common/cubit/weekly_menu_cubit.dart'
    as _i499;
import 'package:build_shopping_list/common/data/recipe_repository.dart'
    as _i877;
import 'package:build_shopping_list/common/data/repositories/menu_repository.dart'
    as _i1022;
import 'package:build_shopping_list/common/domain/use_cases/create_menu.dart'
    as _i527;
import 'package:build_shopping_list/common/domain/use_cases/create_recipe.dart'
    as _i840;
import 'package:build_shopping_list/common/domain/use_cases/get_menu.dart'
    as _i347;
import 'package:build_shopping_list/common/domain/use_cases/get_recipes.dart'
    as _i183;
import 'package:build_shopping_list/features/recipes/presentation/cubit/create_recipe_cubit.dart'
    as _i658;
import 'package:build_shopping_list/features/shopping-list/presentation/cubit/shopping_list_cubit.dart'
    as _i990;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i1022.MenuRepository>(() => _i1022.MenuRepository());
  gh.factory<_i877.RecipeRepository>(() => _i877.RecipeRepository());
  gh.factory<_i990.ShoppingListCubit>(() => _i990.ShoppingListCubit());
  gh.factory<_i183.GetRecipes>(
      () => _i183.GetRecipes(gh<_i877.RecipeRepository>()));
  gh.factory<_i840.CreateRecipe>(
      () => _i840.CreateRecipe(gh<_i877.RecipeRepository>()));
  gh.factory<_i658.CreateRecipeCubit>(
      () => _i658.CreateRecipeCubit(gh<_i840.CreateRecipe>()));
  gh.factory<_i690.RecipesCubit>(
      () => _i690.RecipesCubit(gh<_i183.GetRecipes>()));
  gh.factory<_i527.CreateMenu>(
      () => _i527.CreateMenu(gh<_i1022.MenuRepository>()));
  gh.factory<_i347.GetMenu>(() => _i347.GetMenu(gh<_i1022.MenuRepository>()));
  gh.factory<_i499.WeeklyMenuCubit>(() => _i499.WeeklyMenuCubit(
        gh<_i527.CreateMenu>(),
        gh<_i347.GetMenu>(),
      ));
  return getIt;
}
