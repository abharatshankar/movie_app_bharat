import 'package:flutter/material.dart';
import 'package:movie_app/providers/bottom_navigation_provider.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/screens/popular_movies.dart';
import 'package:provider/provider.dart';

class NavBarScreen extends StatelessWidget {
  NavBarScreen({Key? key}) : super(key: key);

  final List<dynamic> screens = [
    const HomeScreen(),
    const PopularMovies(),
    // Container(
    //   color: Colors.amber,
    // ),
    Container(
      color: Colors.green,
    ),
  ];

  static const String routeName = 'NavBarScreen';

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavigationProvider>(context);

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavProvider.selectedIndex,
          onTap: (index) {
            bottomNavProvider.selectedIndex = index;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.thumb_up_alt),
              label: 'Popular',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_up),
              label: 'Trending',
            ),
          ],
        ),
        body: screens[bottomNavProvider.selectedIndex]);
  }
}
