import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/widgets/drawer_widget.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({
    super.key,
  });

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;
  String _title = "Categories";
  Widget? _selectedScreen;
  final List<Meal> favoritesList = [];

  void _onToggleFavotite(Meal meal) {
    String message = "Meal marked as favorite";
    setState(() {
      if (favoritesList.contains(meal)) {
        favoritesList.remove(meal);
        message = "Meal removed from favorites";
      } else {
        favoritesList.add(meal);
      }
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedIndex == 1) {
      _title = "Favorite";
      _selectedScreen = MealScreen(
        meals: favoritesList,
        onToggleFavotite: _onToggleFavotite,
      );
    } else {
      _title = "Categories";
      _selectedScreen = CategoryScreen(
        onToggleFavotite: _onToggleFavotite,
      );
    }
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(title: Text(_title)),
      body: _selectedScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(
            () {
              _selectedIndex = value;
            },
          );
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_sharp), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
      ),
    );
  }
}
