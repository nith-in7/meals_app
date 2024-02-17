import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/providers/meals_provider.dart';

enum Filter { gluttenFree, vegan, vegeterian, lactoseFree }

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  
  FilterNotifier()
      : super({
          Filter.gluttenFree: false,
          Filter.vegan: false,
          Filter.vegeterian: false,
          Filter.lactoseFree: false,
        });
 
 void setFilter(Filter filter, bool value) {
    state = {...state, filter: value};
  }

}

final filterProvider = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
    (ref) => FilterNotifier());

final filteredMeal = Provider<List<Meal>>(
  (ref) {
   
    final meals = ref.watch(mealProvider);
   
    final filters = ref.watch(filterProvider);
   
   return meals.where((element) {
      if (filters[Filter.gluttenFree]! && !element.isGlutenFree) {
        return false;
      }
      if (filters[Filter.vegan]! && !element.isVegan) {
        return false;
      }
      if (filters[Filter.vegeterian]! && !element.isVegetarian) {
        return false;
      }
      if (filters[Filter.lactoseFree]! && !element.isLactoseFree) {
        return false;
      }
      return true;
    }).toList();
  
  },
);
