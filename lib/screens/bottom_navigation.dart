import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorite_provider.dart';
import 'package:meals_app/providers/filter_provider.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/fliter_screen.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/widgets/drawer_widget.dart';

class BottomNavigationScreen extends ConsumerStatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  ConsumerState<BottomNavigationScreen> createState() =>
      _BottomNavigationScreenState();
}

class _BottomNavigationScreenState
    extends ConsumerState<BottomNavigationScreen> {
  int _selectedIndex = 0;

  String _title = "Categories";

  Widget? _selectedScreen;

  @override
  Widget build(BuildContext context) {
    final favoriteList = ref.watch(favoriteProvider);
    
    void drawerOptionSelected(String identifier) {
      Navigator.pop(context);
      if (identifier == "Meals") {
        if (_selectedIndex == 1) {
          setState(() {
            _selectedIndex = 0;
          });
        }
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) {
              return const FilterScreen();
            },
          ),
        );
      }
    }
    
  final availableMeal=ref.watch(filteredMeal);
    if (_selectedIndex == 1) {
      _title = "Favorite";
      _selectedScreen = MealScreen(
        meals: favoriteList,
      );
    } else {
      _title = "Categories";
      _selectedScreen = CategoryScreen(
        availableMeal: availableMeal,
      );
    }

    return Scaffold(
      drawer: DrawerWidget(drawerOptionSelected: drawerOptionSelected),
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
