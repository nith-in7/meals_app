import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filter_provider.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    
    final filters = ref.watch(filterProvider);
    
    return Scaffold(
      appBar: AppBar(title: const Text("Your Filters")),
     
      body: Column(
       
        children: [

          SwitchListTile(
            value: filters[Filter.gluttenFree]!,
            activeColor: Theme.of(context).colorScheme.tertiary,
            onChanged: (value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.gluttenFree, value);
            },
            subtitle: const Text("Includes only gluteen-free meals"),
            title: Text(
              "Glutten-free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),

          SwitchListTile(
            value: filters[Filter.lactoseFree]!,
            activeColor: Theme.of(context).colorScheme.tertiary,
            onChanged: (value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.lactoseFree, value);
            },
            subtitle: const Text("Includes only lactose-free meals"),
            title: Text(
              "Lactose-free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),

          SwitchListTile(
            value: filters[Filter.vegeterian]!,
            activeColor: Theme.of(context).colorScheme.tertiary,
            onChanged: (value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegeterian, value);
            },
            subtitle: const Text("Includes only vegeterian meals"),
            title: Text(
              "Vegetrian",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ),

          SwitchListTile(
            value: filters[Filter.vegan]!,
            activeColor: Theme.of(context).colorScheme.tertiary,
            onChanged: (value) {
              ref.read(filterProvider.notifier).setFilter(Filter.vegan, value);
            },
            subtitle: const Text("Includes only vegam meals"),
            title: Text(
              "Vegan",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          )
          
        ],
      ),
    );
  }
}
