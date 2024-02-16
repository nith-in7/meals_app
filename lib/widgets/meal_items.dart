import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:transparent_image/transparent_image.dart';



class MealIteams extends StatelessWidget {
  const MealIteams({super.key, required this.meal, required this.selectedMeal});
  final Meal meal;
  final void Function(Meal meal, BuildContext context) selectedMeal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      elevation: 10,
      child: InkWell(
        onTap: () {
          selectedMeal(meal,context);
        },
        child: Stack(
          children: [
            FadeInImage(
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: const Color.fromARGB(140, 0, 0, 0),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.schedule_outlined,
                            color: Colors.white),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          "${meal.duration} min",
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Icon(Icons.work_outline),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          meal.complexity.name[0].toUpperCase() +
                              meal.complexity.name.substring(1),
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Icon(Icons.currency_rupee),
                        Text(
                          meal.affordability.name[0].toUpperCase() +
                              meal.affordability.name.substring(1),
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
