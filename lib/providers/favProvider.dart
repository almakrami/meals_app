import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/Models/meal.dart';

class FavNotifier extends StateNotifier<List<Meal>> {
  FavNotifier() : super([]);

  void toggleFavMealStatus(Meal meal) {
    final mealIsFav = state.contains(meal);

    if (mealIsFav) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favProvider = StateNotifierProvider<FavNotifier, List<Meal>>(
  (ref) => FavNotifier(),
);
