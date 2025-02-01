// Package imports:
import 'package:build_shopping_list/common/data/repositories/menu_repository.dart';
import 'package:build_shopping_list/common/entities/weekly_menu.dart';
import 'package:build_shopping_list/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// Project imports:

@injectable
class CreateMenu {
  final MenuRepository repository;

  CreateMenu(this.repository);

  Future<Either<Failure, WeeklyMenu>> call(WeeklyMenu menu) =>
      repository.createMenu(menu);
}
