import 'package:flutter/material.dart';

import 'package:meals_app/Models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal, required this.onToggleFavourite});

  final Meal meal;
  final void Function(Meal) onToggleFavourite;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(icon: Icon(Icons.star), onPressed: () { onToggleFavourite(meal);}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14),
            Text(
              'ingrediants',
              style: Theme.of(context)
                  .copyWith()
                  .textTheme
                  .titleLarge!
                  .copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final ingrediants in meal.ingredients)
              Text(
                ingrediants,
                style: Theme.of(context)
                    .copyWith()
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
              ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Steps',
              style: Theme.of(context)
                  .copyWith()
                  .textTheme
                  .titleLarge!
                  .copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 24,
            ),
            for (final steps in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  steps,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .copyWith()
                      .textTheme
                      .bodyMedium!
                      .copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
