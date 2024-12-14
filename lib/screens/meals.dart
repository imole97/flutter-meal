import 'package:flutter/material.dart';
import 'package:flutter_meal/models/meal.dart';
import 'package:flutter_meal/screens/meal_detail.dart';
import 'package:flutter_meal/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.categoryTitle,
    // required this.onToggleFavorite,
    required this.meals,
  });
  final String? categoryTitle;
  final List<Meal> meals;
  // final void Function(Meal meal) onToggleFavorite;
  void handleSelectMeal(BuildContext context, Meal meal) {
    Meal? selectedMeal = meals.singleWhere((item) => item.id == meal.id);

    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(
              mealDetail: selectedMeal,
              // onToggleFavorite: onToggleFavorite,
              // key: ValueKey(selectedMeal.id),
            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget mealContent = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(
        meal: meals[index],
        onSelectMeal: (meal) {
          handleSelectMeal(context, meal);
        },
      ),
    );

    if (meals.isEmpty) {
      mealContent = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Oops! Nothing here...',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Try selecting a different category',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            )
          ],
        ),
      );
    }
    if (categoryTitle == null) {
      return mealContent;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: mealContent,
    );
  }
}
