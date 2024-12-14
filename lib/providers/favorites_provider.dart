import 'package:flutter_meal/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// statenotifier is a generic class that takes in the data we manage which is the meal data in this case

//  in state notifiers, we are not allowed to edit an existing object in memory;
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  // Initializing with an empty list of meals
  //initial value of the meal list
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

// we use Provider class to data that doesn't change while we use StateNotifierProvider for data that can change
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
