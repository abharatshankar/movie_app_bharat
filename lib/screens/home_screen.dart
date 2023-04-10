import 'package:flutter/material.dart';
import 'package:movie_app/helpers/constants.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:movie_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = StrConstants.homeRoute;

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(StrConstants.moviesTitle),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: StrConstants.popularCap,
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
            MovieSlider(
              movies: moviesProvider.topRated,
              title: StrConstants.topRated,
              onNextPage: () => moviesProvider.getTopRatedMovies(),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
