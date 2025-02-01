part of 'weekly_menu_cubit.dart';

@freezed
class WeeklyMenuState with _$WeeklyMenuState {
  const factory WeeklyMenuState.initial() = _Initial;
  const factory WeeklyMenuState.loading() = _Loading;
  const factory WeeklyMenuState.success(WeeklyMenu menu) = _Success;
  const factory WeeklyMenuState.failure(String message) = _Failure;
}
