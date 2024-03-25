import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/Models/meal.dart';
import 'package:meals_app/Screens/filters.dart';
import 'package:meals_app/Screens/categories.dart';
import 'package:meals_app/Screens/mainDrawer.dart';
import 'package:meals_app/Screens/meals.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod/riverpod.dart';


const kInitialFilters = {
  FilterOptions.glutenFree: false,
  FilterOptions.lactoseFree: false,
  FilterOptions.vegan: false,
  FilterOptions.vegetarian: false,
};


class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];


  Map <FilterOptions, bool> _selectedFilters = {
    FilterOptions.glutenFree: false,
    FilterOptions.lactoseFree: false,
    FilterOptions.vegan: false,
    FilterOptions.vegetarian: false,
  };

  
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
        showInfoMessage('Removed from Favourites');
      });
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

  void _setScreen(String identifier) async{
    if (identifier == 'filters') {
     final resault =await  Navigator.of(context).push<Map<FilterOptions,bool >> (MaterialPageRoute(builder: (ctx) =>  FiltersScreen(currentFilters: _selectedFilters,),),
      );

      setState(() {
              _selectedFilters = resault ??   kInitialFilters;

      });
      }
  }

  @override

  
  Widget build(BuildContext context) {
    ref.watch(meals_provider);
    // final availableMeals = dummyMeals.where((meal) {
        if(_selectedFilters[FilterOptions.glutenFree]! && !meal.isGlutenFree){
          return false;
        }
        if(_selectedFilters[FilterOptions.lactoseFree]! && !meal.isLactoseFree){
          return false;
        }
        if(_selectedFilters[FilterOptions.vegan]! && !meal.isVegan){
          return false;
        }
        if(_selectedFilters[FilterOptions.vegetarian]! && !meal.isVegetarian){
          return false;
        }
        return true;
  }).toList();
  
  Widget activePage =
        CategoriesScreen(onToggleFavourite: _toggleMealFavouriteStatus, availableMeals: availableMeals);
   
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
      drawer: MainDrawer(onSelectedScreen: _setScreen),
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
