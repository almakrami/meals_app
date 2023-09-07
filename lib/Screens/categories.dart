
import 'package:flutter/material.dart';
import 'package:meals_app/Data/dummey_data.dart';
import 'package:meals_app/Widgets/category_grid_item.dart';


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('what category you want?'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children:  [
          for (final category in availableCategories)
              Category_grid_item(category: category)
        ],
      ),
    );
  }
}
