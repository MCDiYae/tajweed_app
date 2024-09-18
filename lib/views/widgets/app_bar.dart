import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: const Text('قواعد تجويد القران الكريم'),
    backgroundColor: Theme.of(context).primaryColor,
    actions: [
      IconButton(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        icon: const Icon(Icons.search),
        onPressed: () {
          // Implement search functionality here
        },
      ),
    ],
  );
}
