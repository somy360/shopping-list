// Package imports:
import 'package:build_shopping_list/common/entities/weekly_menu.dart';
import 'package:build_shopping_list/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:isar/isar.dart';

class MenuDataSource {
  Future<Either<Failure, WeeklyMenu>> createMenu(WeeklyMenu menu) async {
    try {
      final isar = Isar.getInstance();

      if (isar == null) {
        return const Left(Failure('database not initialized'));
      }

      await isar.writeTxn(() async {
        await isar.weeklyMenus.clear();
        await isar.weeklyMenus.put(menu);
      });
      return Right(menu);
    } catch (e) {
      return const Left(Failure('Error creating recipe'));
    }
  }

  Future<Either<Failure, WeeklyMenu>> getMenu() async {
    try {
      final isar = Isar.getInstance();

      if (isar == null) {
        return const Left(Failure('database not initialized'));
      }

      final menus = await isar.weeklyMenus.where().findAll();

      if (menus.isEmpty) {
        return const Left(Failure('No recipes found'));
      }
      return Right(menus.first);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
