import 'package:flutter/material.dart';
import 'package:meals_app/data/category_data.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/fliter_screen.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/widgets/drawer_widget.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
 
  int _selectedIndex = 0;

  String _title = "Categories";

  Widget? _selectedScreen;

  Map<Filter, bool> filters = {
    Filter.gluttenFree: false,
    Filter.lactoseFree: false,
    Filter.vegan: false,
    Filter.vegeterian: false,
  };

  final List<Meal> favoritesList = [];

  void _drawerOptionSelected(String identifier) async {
    if (identifier == "Meal") {
      Navigator.pop(context);
    } else {
      Navigator.pop(context);
      final result = await Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(
          builder: (ctx) {
            return FilterScreen(
              currentFilter: filters,
            );
          },
        ),
      );
      setState(() {
        if (result != null) {
          filters = result;
        }
      });
    }
  }

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
   
    final List<Meal> availableMeal = dummyMeals.where((element) {
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

    if (_selectedIndex == 1) {
      _title = "Favorite";
      _selectedScreen = MealScreen(
        meals: favoritesList,
        onToggleFavotite: _onToggleFavotite,
      );
    } else {
      _title = "Categories";
      _selectedScreen = CategoryScreen(
        availableMeal: availableMeal,
        onToggleFavotite: _onToggleFavotite,
      );
    }
   
    return Scaffold(
      drawer: DrawerWidget(drawerOptionSelected: _drawerOptionSelected),
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
