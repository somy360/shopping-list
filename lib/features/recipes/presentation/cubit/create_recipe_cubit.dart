import 'package:bloc/bloc.dart';
import 'package:build_shopping_list/common/domain/use_cases/create_recipe.dart';
import 'package:build_shopping_list/common/entities/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_recipe_state.dart';
part 'create_recipe_cubit.freezed.dart';

@injectable
class CreateRecipeCubit extends Cubit<CreateRecipeState> {
  CreateRecipeCubit(this._createRecipe) : super(const CreateRecipeState.initial());

  final CreateRecipe _createRecipe;

  Future<void> createRecipe(Recipe recipe) async {
    emit(const CreateRecipeState.loading());
    final result = await _createRecipe(recipe);
    result.fold(
      (failure) => emit(CreateRecipeState.failure(failure.message)),
      (recipe) => emit(CreateRecipeState.success(recipe)),
    );
  }
}
