import 'package:flutter/material.dart';
import 'package:meals_app/model/category.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/widgets/meal_items.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, required this.category, required this.meals});
  final Category category;
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return MealIteams(meal: meals[index]);
        });
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Uh oh ... nothing here!",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            const SizedBox(
              height: 10,
            ),
            Text("Try selecting a different category!",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground))
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      
      body: content,
    );
  }
}
