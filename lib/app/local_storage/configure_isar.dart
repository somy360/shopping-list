import 'package:build_shopping_list/common/entities/recipe.dart';
import 'package:build_shopping_list/common/entities/weekly_menu.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

Future<void> configureIsar() async {
  final dir = await getApplicationDocumentsDirectory();

  await Isar.open(
    [
      RecipeSchema,
      WeeklyMenuSchema,
    ],
    directory: dir.path,
  );
}
