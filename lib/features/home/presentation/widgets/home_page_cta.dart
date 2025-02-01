import 'package:flutter/material.dart';

class HomePageCta extends StatelessWidget {
  const HomePageCta({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onPressed,
              child: Text(title),
            ),
          ),
        ],
      ),
    );
  }
}
