import 'package:bloc/bloc.dart';
import 'package:build_shopping_list/common/domain/use_cases/get_recipes.dart';
import 'package:build_shopping_list/common/entities/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'recipes_state.dart';
part 'recipes_cubit.freezed.dart';

@injectable
class RecipesCubit extends Cubit<RecipesState> {
  RecipesCubit(this._getRecipes) : super(const RecipesState.initial());
  final GetRecipes _getRecipes;

  //TODO: add pagination here, plus a method to fetcch an individual
  //record and add it the success emit, possibly also another method to
  //fetch multiple recipes
  Future<void> getRecipes() async {
    emit(const RecipesState.loading());
    final result = await _getRecipes();
    result.fold(
      (failure) => emit(RecipesState.failure(failure.message)),
      (recipe) => emit(RecipesState.success(recipe)),
    );
  }
}
