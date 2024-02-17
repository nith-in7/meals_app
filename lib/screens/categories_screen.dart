import 'package:flutter/material.dart';
import 'package:meals_app/data/category_data.dart';
import 'package:meals_app/model/category.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
    required this.availableMeal,
  });

  final List<Meal> availableMeal;

  void _selectCategory(BuildContext context, Category category) {
   
    final List<Meal> meal =
        availableMeal.where((e) => e.categories.contains(category.id)).toList();
   
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) {
          return MealScreen(
            title: category.title,
            meals: meal,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          childAspectRatio: 1.5,
          mainAxisSpacing: 16),
      children: [
        ...availableCategories.map(
          (e) => InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              _selectCategory(context, e);
            },
            child: CategoryGrid(category: e),
          ),
        ),
      ],
    );
  }
}
