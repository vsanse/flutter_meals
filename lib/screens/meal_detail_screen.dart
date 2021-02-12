import 'package:flutter/material.dart';
import 'package:flutter_meals/data/dummy_data.dart';
import 'package:flutter_meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-details";

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer({Widget child}) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routeArgs['id'];
    final Meal selectedMeal = DUMMY_MEALS.firstWhere((item) => item.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              child: ListView.builder(
                itemBuilder: (_, idx) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      selectedMeal.ingredients[idx],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              child: ListView.builder(
                itemBuilder: (_, idx) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          (idx + 1).toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: Theme.of(context).accentColor,
                      ),
                      title: Text(selectedMeal.steps[idx]),
                    ),
                    Divider()
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
