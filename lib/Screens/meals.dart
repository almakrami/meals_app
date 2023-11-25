

import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';

import 'package:meals_app/Screens/meal_details.dart';


import 'package:meals_app/Widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.meals,
     this.title,
  });

  final String? title;
  final List<Meal> meals;
 void selectMeal(BuildContext context, Meal meal){
  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> MealDetailsScreen(meal: meal)));
 }

  @override
  Widget build(context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'uh oh ... nothing is here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),
    );

    if (meals.isNotEmpty){
      content = ListView.builder(itemCount:meals.length,

      itemBuilder: (ctx, index) => MealItem(meal: meals[index],onSelectMeal: (meal){
        selectMeal(context, meal);
      },)


      );
    }

    if(title == null) {
      return content;
    }
    return Scaffold(

      appBar: AppBar(title: Text(title!),
      ),
      body: content,
    );
  }
}
