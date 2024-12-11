import 'package:flutter/material.dart';
import 'package:flutter_meal/models/meal.dart';
import 'package:flutter_meal/screens/meal_categories.dart';
import 'package:flutter_meal/screens/meals.dart';
import 'package:flutter_meal/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeal = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _toggleFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeal.contains(meal);
    if (isExisting) {
      setState(() {
        _favoriteMeal.remove(meal);
      });
      _showInfoMessage("Removed from favorites");
    } else {
      setState(() {
        _favoriteMeal.add(meal);
      });
      _showInfoMessage("Added to favorites");
    }
  }

  void _selectPage(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = MealCategoriesScreen(
      onToggleFavorite: _toggleFavoriteStatus,
    );
    var activePageTitle = "Categories";
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeal,
        onToggleFavorite: _toggleFavoriteStatus,
      );
      activePageTitle = "Favorites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: const MainDrawer(),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
