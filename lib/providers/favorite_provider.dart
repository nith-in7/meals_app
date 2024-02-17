import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/meal.dart';

class FavoriteNotifer extends StateNotifier<List<Meal>> {
  FavoriteNotifer() : super([]);

  bool onToggleFavotite(Meal meal) {
    bool isFavorite = state.contains(meal);
    if (isFavorite) {
      state = state.where((element) => element != meal).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }

  bool isFavorite(Meal meal) {
    if (state.contains(meal)) return true;
    return false;
  }
}

final favoriteProvider = StateNotifierProvider<FavoriteNotifer, List<Meal>>(
    (ref) => FavoriteNotifer());
