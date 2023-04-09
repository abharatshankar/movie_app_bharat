import 'package:flutter/material.dart';

// Imports

import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/screens/details_screen.dart';

// Exports

export 'package:movie_app/screens/home_screen.dart';
export 'package:movie_app/screens/details_screen.dart';

// Routes

Map<String, WidgetBuilder> getAplicationRoutes() => <String, WidgetBuilder>{
      HomeScreen.routeName: (BuildContext context) => const HomeScreen(),
      DetailsScreen.routeName: (BuildContext context) => const DetailsScreen(),
    };
