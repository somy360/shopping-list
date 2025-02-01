import 'package:bloc/bloc.dart';
import 'package:build_shopping_list/common/domain/use_cases/create_menu.dart';
import 'package:build_shopping_list/common/domain/use_cases/get_menu.dart';
import 'package:build_shopping_list/common/entities/day.dart';
import 'package:build_shopping_list/common/entities/meal.dart';
import 'package:build_shopping_list/common/entities/weekly_menu.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'weekly_menu_state.dart';
part 'weekly_menu_cubit.freezed.dart';

@injectable
class WeeklyMenuCubit extends Cubit<WeeklyMenuState> {
  WeeklyMenuCubit(this._createMenu, this._getMenu)
      : super(const WeeklyMenuState.initial());

  final CreateMenu _createMenu;
  final GetMenu _getMenu;

  WeeklyMenu? _menu;

  Future<void> updateMenu({
    required Day day,
    required Meal meal,
    required int recipeId,
  }) async {
    emit(const WeeklyMenuState.loading());
    List<DailyMenu> dailyMenus = _menu?.days ?? [];
    final dailyMenu = dailyMenus.firstWhere((element) => element.name == day);

    final updatedDailyMenu = dailyMenu.copyWith(
      breakfastRecipeId:
          meal == Meal.breakfast ? recipeId : dailyMenu.breakfastRecipeId,
      lunchRecipeId: meal == Meal.lunch ? recipeId : dailyMenu.lunchRecipeId,
      dinnerRecipeId: meal == Meal.dinner ? recipeId : dailyMenu.dinnerRecipeId,
    );
    final index = dailyMenus.indexWhere((element) => element.name == day);
    dailyMenus[index] = updatedDailyMenu;
    _menu = _menu!.copyWith(days: dailyMenus);

    final result = await _createMenu(_menu!);
    result.fold(
      (failure) => emit(WeeklyMenuState.failure(failure.message)),
      (menu) => emit(WeeklyMenuState.success(menu)),
    );
  }

  Future<void> createMenu() async {
    emit(const WeeklyMenuState.loading());
    _menu = WeeklyMenu(
      id: 0,
      days: [
        DailyMenu(
          id: 0,
          name: Day.monday,
        ),
        DailyMenu(
          id: 1,
          name: Day.tuesday,
        ),
        DailyMenu(
          id: 2,
          name: Day.wednesday,
        ),
        DailyMenu(
          id: 3,
          name: Day.thursday,
        ),
        DailyMenu(
          id: 4,
          name: Day.friday,
        ),
        DailyMenu(
          id: 5,
          name: Day.saturday,
        ),
        DailyMenu(
          id: 6,
          name: Day.sunday,
        ),
      ],
    );
    final result = await _createMenu(_menu!);
    result.fold(
      (failure) => emit(WeeklyMenuState.failure(failure.message)),
      (menu) => emit(WeeklyMenuState.success(menu)),
    );
  }

  Future<void> getMenu() async {
    emit(const WeeklyMenuState.loading());
    final result = await _getMenu();
    result.fold(
      (failure) => emit(WeeklyMenuState.failure(failure.message)),
      (menu) {
        emit(WeeklyMenuState.success(menu));
        _menu = menu;
      },
    );
  }
}
