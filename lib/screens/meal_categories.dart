import 'package:flutter/material.dart';
import 'package:flutter_meal/models/category.dart';
import 'package:flutter_meal/models/dummy_data.dart';
import 'package:flutter_meal/models/meal.dart';
import 'package:flutter_meal/screens/meals.dart';
import 'package:flutter_meal/widgets/category_grid_item.dart';

class MealCategoriesScreen extends StatefulWidget {
  const MealCategoriesScreen(
      {super.key,
      // required this.onToggleFavorite,
      required this.availableMeals});
  // final Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  @override
  State<MealCategoriesScreen> createState() => _MealCategoriesScreenState();
}

// singletickerprovider is used when we want to have a single animation in the state
// we use tickerprovider when we have multiple animations
class _MealCategoriesScreenState extends State<MealCategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // vsync ensures the animation excutes for every frame(60 times per second). it is always required for an animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleSelectCategory(BuildContext context, Category category) {
    final List<Meal> mealCategory = widget.availableMeals
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
    return AnimatedBuilder(
        animation:
            _animationController, // tells the animation builder when to call the builder function
        // the child property is for widgets that  will be outputted with the animated content but will not be animated
        child: GridView(
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
        ),
        builder: (context, child) => Padding(
              padding: EdgeInsets.only(top: _animationController.value * 100),
              child: child,
            ));
  }
}
