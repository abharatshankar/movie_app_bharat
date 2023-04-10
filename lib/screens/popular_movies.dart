import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:movie_app/widgets/horizantal_poster.dart';
import 'package:provider/provider.dart';

class PopularMovies extends StatefulWidget {
  const PopularMovies({super.key});

  @override
  State<PopularMovies> createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MovieProvider>(context);

    final List<Movie> movies = moviesProvider.popularMovies;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        controller: _scrollController
          ..addListener(() {
            double maxScroll = Scrollable.of(context).position.maxScrollExtent;
            double currentScroll = Scrollable.of(context).position.pixels;
            double delta = MediaQuery.of(context).size.height * 0.20;
            if (maxScroll - currentScroll <= delta) {
              moviesProvider.getPopularMovies();
            }
          }),
        itemCount: movies.length + 1,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          if (index == movies.length) {
            moviesProvider.getPopularMovies();
            return _buildProgressIndicator();
          }

          return HorizantalPoster(
            index: index,
            movie: movies[index],
            title: movies[index].title,
          );
        },
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: CircularProgressIndicator(),
      ),
    );
  }
}
