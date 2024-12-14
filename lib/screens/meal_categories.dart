import 'package:flutter/material.dart';
import 'package:flutter_meal/models/category.dart';
import 'package:flutter_meal/models/dummy_data.dart';
import 'package:flutter_meal/models/meal.dart';
import 'package:flutter_meal/screens/meals.dart';
import 'package:flutter_meal/widgets/category_grid_item.dart';

class MealCategoriesScreen extends StatelessWidget {
  const MealCategoriesScreen(
      {super.key,
      // required this.onToggleFavorite,
      required this.availableMeals});
  // final Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;
  void _handleSelectCategory(BuildContext context, Category category) {
    final List<Meal> mealCategory = availableMeals
        .where((meal) => meal.categories.contains(category.categoryId))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
            // onToggleFavorite: onToggleFavorite,
            categoryTitle: category.categoryTitle,
            meals: mealCategory),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: availableCategories.map((category) {
        return CategoryGridItem(
          onSelectCategory: _handleSelectCategory,
          category: category,
          key: ValueKey(category.categoryId),
        );
      }).toList(),
    );
  }
}
