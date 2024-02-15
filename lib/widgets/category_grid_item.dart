import 'package:flutter/material.dart';
import 'package:meals_app/model/category.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            category.color.withOpacity(0.5),
            category.color.withOpacity(0.8)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        ),
      ),
      child: Text(
        category.title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
    );
  }
}
