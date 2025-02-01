import 'package:build_shopping_list/common/data/data_sources/menu_data_source.dart';
import 'package:build_shopping_list/common/entities/weekly_menu.dart';
import 'package:build_shopping_list/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class MenuRepository {
  final MenuDataSource _dataSource = MenuDataSource();

  Future<Either<Failure, WeeklyMenu>> createMenu(WeeklyMenu menu) =>
      _dataSource.createMenu(menu);

  Future<Either<Failure, WeeklyMenu>> getMenu() =>
      _dataSource.getMenu();
}
