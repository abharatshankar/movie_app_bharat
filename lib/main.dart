import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_app/providers/bottom_navigation_provider.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:movie_app/routes/routes.dart';
import 'package:movie_app/screens/bottom_nav.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const AppSatate());
}

class AppSatate extends StatelessWidget {
  const AppSatate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieProvider(), lazy: false),
        ChangeNotifierProvider(
            create: (_) => BottomNavigationProvider(), lazy: false),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
        ),
      ),
      initialRoute: NavBarScreen.routeName,
      routes: getAplicationRoutes(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'My App',
//       home: HomeScreen(),
//     );
//   }
// }
