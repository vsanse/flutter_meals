import 'package:flutter/material.dart';
import 'package:flutter_meals/data/dummy_data.dart';
import 'package:flutter_meals/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deli Meals'),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: GridView(
        padding: const EdgeInsets.all(15),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                catData.title,
                catData.color,
                catData.id,
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
