import 'package:flutter/material.dart';
import 'package:flutter_meal/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({
    super.key,
    required this.mealDetail,
    required this.onToggleFavorite,
  });

  final Meal mealDetail;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealDetail.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(mealDetail);
            },
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(mealDetail.imageUrl,
                height: 300, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 14),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final ingredient in mealDetail.ingredients)
              Text(
                ingredient,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                textAlign: TextAlign.center,
                "Steps",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            for (final step in mealDetail.steps)
              Text(
                step,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
          ],
        ),
      ),
    );
  }
}
