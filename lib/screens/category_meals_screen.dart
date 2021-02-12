import 'package:flutter/material.dart';
import 'package:flutter_meals/data/dummy_data.dart';
import 'package:flutter_meals/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (_, idx) {
          return MealItem(
            affordability: categoryMeals[idx].affordability,
            title: categoryMeals[idx].title,
            imageUrl: categoryMeals[idx].imageUrl,
            duration: categoryMeals[idx].duration,
            complexity: categoryMeals[idx].complexity,
            id: categoryMeals[idx].id,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
