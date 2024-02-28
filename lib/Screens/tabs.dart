import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';

import 'package:meals_app/Screens/categories.dart';
import 'package:meals_app/Screens/mainDrawer.dart';
import 'package:meals_app/Screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];

  void showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void _toggleMealFavouriteStatus(Meal meal) {
    final isExisting = _favouriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        _favouriteMeals.remove(meal);
        showInfoMessage('Removed from Favourites');});
    } else {
      setState(() {
        _favouriteMeals.add(meal);
        showInfoMessage('Added to Favourites');
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage =
        CategoriesScreen(onToggleFavourite: _toggleMealFavouriteStatus);
    var activePagetitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
          meals: _favouriteMeals,
          onToggleFavourite: _toggleMealFavouriteStatus);
      activePagetitle = 'Your Favourite';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePagetitle),
      ),
      drawer: const MainDrawer(),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          )
        ],
      ),
    );
  }
}
