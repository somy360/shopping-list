// Package imports:
import 'package:build_shopping_list/common/data/repositories/menu_repository.dart';
import 'package:build_shopping_list/common/entities/weekly_menu.dart';
import 'package:build_shopping_list/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// Project imports:

@injectable
class GetMenu {
  final MenuRepository repository;

  GetMenu(this.repository);

  Future<Either<Failure, WeeklyMenu>> call() => repository.getMenu();
}
