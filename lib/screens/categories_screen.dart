import 'package:flutter/material.dart';
import 'package:meals_app/data/category_data.dart';
import 'package:meals_app/model/category.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    super.key,
    required this.availableMeal,
  });

  final List<Meal> availableMeal;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController animationController;

  late Animation<Offset> slideAnimation;

  
 
  @override
  void initState() {


    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1300));
    slideAnimation = Tween(begin: const Offset(0, 0.2), end: Offset.zero)
        .animate(CurvedAnimation(parent: animationController, curve: Curves.elasticOut) );
  
    super.initState();

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final List<Meal> meal = widget.availableMeal
        .where((e) => e.categories.contains(category.id))
        .toList();

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
    return SlideTransition(
      position: slideAnimation,
      child: GridView(
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
      ),
    );
  }
}
