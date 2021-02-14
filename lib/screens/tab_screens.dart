import 'package:flutter/material.dart';
import 'package:flutter_meals/screens/categories_screen.dart';
import 'package:flutter_meals/screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = [
    CategoriesScreen(),
    FavoritesScreen(),
  ];

  int selectedPageIdx = 0;
  void _selectPage(int idx) {
    setState(() {
      selectedPageIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Meal'),
          // bottom: TabBar(
          //   tabs: [
          //     Tab(
          //       icon: Icon(
          //         Icons.category,
          //       ),
          //       text: 'categories',
          //     ),
          //     Tab(
          //       icon: Icon(
          //         Icons.star,
          //       ),
          //       text: 'Favorites',
          //     )
          //   ],
          // ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).accentColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white30,
          currentIndex: selectedPageIdx,
          onTap: _selectPage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            )
          ],
        ),
        body: _pages[selectedPageIdx]);
  }
}

// DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Meal'),
//           bottom: TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(
//                   Icons.category,
//                 ),
//                 text: 'categories',
//               ),
//               Tab(
//                 icon: Icon(
//                   Icons.star,
//                 ),
//                 text: 'Favorites',
//               )
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             CategoriesScreen(),
//             FavoritesScreen(),
//           ],
//         ),
//       ),
//     );
