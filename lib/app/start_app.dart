import 'package:build_shopping_list/app/localization/build_shopping_list_localizations.dart';
import 'package:build_shopping_list/app/router.dart';
import 'package:build_shopping_list/app/theme/theme.dart';
import 'package:build_shopping_list/common/cubit/recipes_cubit.dart';
import 'package:build_shopping_list/common/cubit/weekly_menu_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: buildTheme(),
      localizationsDelegates: const [
        BuildShoppingListLocalizations.delegate,
      ],
      supportedLocales: BuildShoppingListLocalizations.supportedLocales,
      routerConfig: router,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<RecipesCubit>(
              create: (_) => GetIt.I<RecipesCubit>(),
              lazy: true,
            ),
            BlocProvider<WeeklyMenuCubit>(
              create: (_) => GetIt.I<WeeklyMenuCubit>(),
              lazy: true,
            ),
          ],
          child: child!,
        );
      },
    );
  }
}
