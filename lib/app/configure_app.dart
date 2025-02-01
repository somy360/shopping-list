import 'package:build_shopping_list/app/local_storage/configure_isar.dart';
import 'package:build_shopping_list/app/start_app.dart';
import 'package:build_shopping_list/dependencies.dart';
import 'package:flutter/material.dart';

class ConfigureApp {
  static Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();
    configureDependencies();
    await configureIsar();

    runApp(const StartApp());
  }
}
