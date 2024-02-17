import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/category_data.dart';
import 'package:meals_app/model/meal.dart';

final Provider<List<Meal>> mealProvider =
    Provider<List<Meal>>((ref) => dummyMeals);
