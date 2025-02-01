part of 'create_recipe_cubit.dart';

@freezed
class CreateRecipeState with _$CreateRecipeState {
  const factory CreateRecipeState.initial() = _Initial;
  const factory CreateRecipeState.success(Recipe recipe) = _Success;
  const factory CreateRecipeState.loading() = _Loading;
  const factory CreateRecipeState.failure(String message) = _Failure;
}
