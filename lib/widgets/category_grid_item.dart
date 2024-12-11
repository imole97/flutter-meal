import 'package:flutter/material.dart';
import 'package:flutter_meal/models/category.dart';
import 'package:flutter_meal/models/dummy_data.dart';
import 'package:flutter_meal/models/meal.dart';
import 'package:flutter_meal/screens/meals.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });
  final Category category;
  final Function onSelectCategory;
 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //ink well gives us the ontap functionality with visual feedback unlike gesturedetector
      onTap: () {
        onSelectCategory(context, category);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            category.categoryColor.withOpacity(0.55),
            category.categoryColor.withOpacity(0.9)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Text(
          category.categoryTitle,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}
