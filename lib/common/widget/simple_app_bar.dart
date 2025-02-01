import 'package:build_shopping_list/common/widget/shopping_list_back_button.dart';
import 'package:flutter/material.dart';

class SimpleAppBar extends StatelessWidget {
  const SimpleAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ShoppingListBackButton(),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
      ],
    );
  }
}
