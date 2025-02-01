// Package imports:
import 'package:build_shopping_list/common/entities/day.dart';
import 'package:isar/isar.dart';

// Project imports:
part 'weekly_menu.g.dart';

@collection
class WeeklyMenu {
  WeeklyMenu({
    required this.id,
    required this.days,
  });

  Id? id; // you can also use id = null to auto increment

  List<DailyMenu>? days;

  WeeklyMenu copyWith({
    Id? id,
    List<DailyMenu>? days,
  }) {
    return WeeklyMenu(
      id: id ?? this.id,
      days: days ?? this.days,
    );
  }
}

@embedded
class DailyMenu {
  DailyMenu({
    this.id,
    this.name,
    this.breakfastRecipeId,
    this.lunchRecipeId,
    this.dinnerRecipeId,
  });

  int? id;
  @Enumerated(EnumType.name)
  Day? name;
  int? breakfastRecipeId;
  int? lunchRecipeId;
  int? dinnerRecipeId;

  DailyMenu copyWith({
    int? id,
    Day? name,
    int? breakfastRecipeId,
    int? lunchRecipeId,
    int? dinnerRecipeId,
  }) {
    return DailyMenu(
      id: id ?? this.id,
      name: name ?? this.name,
      breakfastRecipeId: breakfastRecipeId ?? this.breakfastRecipeId,
      lunchRecipeId: lunchRecipeId ?? this.lunchRecipeId,
      dinnerRecipeId: dinnerRecipeId ?? this.dinnerRecipeId,
    );
  }
}
