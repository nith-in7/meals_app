import 'package:flutter/material.dart';

enum Filter { gluttenFree, vegan, vegeterian, lactoseFree }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilter});

  final Map<Filter, bool> currentFilter;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _gluttenFreeFilter = false;
  bool _lactoseFreeFilter = false;
  bool _vegeterianFreeFilter = false;
  bool _veganFreeFilter = false;

  @override
  void initState() {
    super.initState();
    _gluttenFreeFilter = widget.currentFilter[Filter.gluttenFree]!;
    _lactoseFreeFilter = widget.currentFilter[Filter.lactoseFree]!;
    _veganFreeFilter = widget.currentFilter[Filter.vegan]!;
    _vegeterianFreeFilter = widget.currentFilter[Filter.vegeterian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Filters")),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          Navigator.of(context).pop({
            Filter.gluttenFree: _gluttenFreeFilter,
            Filter.vegan: _veganFreeFilter,
            Filter.vegeterian: _vegeterianFreeFilter,
            Filter.lactoseFree: _lactoseFreeFilter,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _gluttenFreeFilter,
              activeColor: Theme.of(context).colorScheme.tertiary,
              onChanged: (value) {
                setState(() {
                  _gluttenFreeFilter = value;
                });
              },
              subtitle: const Text("Includes only gluteen-free meals"),
              title: Text(
                "Glutten-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
            SwitchListTile(
              value: _lactoseFreeFilter,
              activeColor: Theme.of(context).colorScheme.tertiary,
              onChanged: (value) {
                setState(() {
                  _lactoseFreeFilter = value;
                });
              },
              subtitle: const Text("Includes only lactose-free meals"),
              title: Text(
                "Lactose-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
            SwitchListTile(
              value: _vegeterianFreeFilter,
              activeColor: Theme.of(context).colorScheme.tertiary,
              onChanged: (value) {
                setState(() {
                  _vegeterianFreeFilter = value;
                });
              },
              subtitle: const Text("Includes only vegeterian meals"),
              title: Text(
                "Vegetrian",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
            SwitchListTile(
              value: _veganFreeFilter,
              activeColor: Theme.of(context).colorScheme.tertiary,
              onChanged: (value) {
                setState(() {
                  _veganFreeFilter = value;
                });
              },
              subtitle: const Text("Includes only vegam meals"),
              title: Text(
                "Vegan",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            )
          ],
        ),
      ),
    );
  }
}
