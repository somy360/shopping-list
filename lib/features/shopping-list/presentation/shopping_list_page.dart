import 'package:build_shopping_list/common/cubit/recipes_cubit.dart';
import 'package:build_shopping_list/common/cubit/weekly_menu_cubit.dart';
import 'package:build_shopping_list/common/widget/shopping_list_back_button.dart';
import 'package:build_shopping_list/features/shopping-list/presentation/cubit/shopping_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ShooppingListPage extends StatefulWidget {
  const ShooppingListPage({super.key});

  @override
  State<ShooppingListPage> createState() => _ShooppingListPageState();
}

class _ShooppingListPageState extends State<ShooppingListPage> {
  final _cubit = GetIt.I<ShoppingListCubit>();
  @override
  void initState() {
    _createList();
    super.initState();
  }

  _createList() {
    _cubit.buildShoppingList(
      context.read<RecipesCubit>(),
      context.read<WeeklyMenuCubit>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ShoppingListBackButton(),
              BlocBuilder<ShoppingListCubit, ShoppingListState>(
                bloc: _cubit,
                builder: (context, state) {
                  return state.maybeMap(
                    loading: (_) => const CircularProgressIndicator(),
                    success: (state) {
                      return ReorderableListView.builder(
                        itemCount: state.list.items!.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          //TODO: refactor this into its own widget
                          //TODO: should shopping list item just be the name generated when the list is generated, using the below format?
                          final item = state.list.items![index];
                          // String text =
                          //     '${item.name!}${item.quantity == 0 ? '' : ' (${item.quantity} '}${item.unit == '' ? '' : '${item.unit})'}';
                          TextEditingController controller =
                              TextEditingController(text: item.displayName);
                          return CheckboxListTile(
                            key: ValueKey(item.id),
                            // dense: true,
                            onChanged: (value) {
                              _cubit.updateItem(
                                item: item.copyWith(isChecked: value),
                              );
                            },
                            title: EditableText(
                              controller: controller,
                              backgroundCursorColor: Colors.black,
                              cursorColor:
                                  Theme.of(context).colorScheme.secondary,
                              focusNode: FocusNode(),
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                              // onChanged: (value) {
                              //   _cubit.updateItem(item.copyWith(name: value));
                              // },
                              // onChanged: (value) {
                              //   _cubit.updateItem(item.copyWith(name: value));
                              // },
                              // onTapOutside: (event) {
                              //   _cubit.updateItem(
                              //       item.copyWith(name: controller.text));
                              // },
                              // TODO: needs to work onchanged without updating the state
                              onChanged: (value) {
                                _cubit.updateItem(
                                    item: item.copyWith(displayName: value),
                                    emitStates: false);
                              },
                              onSubmitted: (value) {
                                _cubit.updateItem(
                                    item: item.copyWith(displayName: value),
                                    emitStates: true);
                              },
                            ),
                            // subtitle: Text('${item.quantity} ${item.unit}'),
                            value: item.isChecked,
                          );
                        },
                        onReorder: (int oldIndex, int newIndex) {
                          print('oldIndex: $oldIndex, newIndex: $newIndex');
                          // if (newIndex > oldIndex) {
                          _cubit.reorderItems(oldIndex, newIndex);
                          // } else {
                          //   _cubit.reorderItems(oldIndex, newIndex - 1);
                          // }
                        },
                      );
                    },
                    orElse: () => const Text('Error'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
