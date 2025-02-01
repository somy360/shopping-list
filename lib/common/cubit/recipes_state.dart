part of 'recipes_cubit.dart';

@freezed
class RecipesState with _$RecipesState {
  const factory RecipesState.initial() = _Initial;
  const factory RecipesState.loading() = _Loading;
  const factory RecipesState.success(List<Recipe> myRecipes) = _Success;
  const factory RecipesState.failure(String message) = _Failure;
}