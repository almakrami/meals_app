import 'package:flutter/material.dart';
import 'package:meals_app/Data/dummey_data.dart';
import 'package:meals_app/Screens/meals.dart';
import 'package:meals_app/Widgets/category_grid_item.dart';
import 'package:meals_app/Models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
    .where((meal) => meal.categories.contains(category.id))
    .toList();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) =>  MealsScreen(
                  title: category.title,
                  meals: filteredMeals,
                )));
  }

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
        children: [
          for (final category in availableCategories)
            Category_grid_item(
              category: category,
              onSelectcCategory: () {
                _selectCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
