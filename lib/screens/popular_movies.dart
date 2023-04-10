import 'package:flutter/material.dart';
import 'package:movie_app/helpers/constants.dart';
import 'package:movie_app/helpers/helper_widget.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:movie_app/widgets/horizantal_poster.dart';
import 'package:provider/provider.dart';

class PopularMovies extends StatefulWidget {
  const PopularMovies({super.key, required this.isPopularMovies});
  final bool isPopularMovies;

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

    final List<Movie> movies = widget.isPopularMovies
        ? moviesProvider.popularMovies
        : moviesProvider.topRated;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isPopularMovies
            ? StrConstants.popularMoviesTitle
            : StrConstants.topRatedMoviesTitle),
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
              widget.isPopularMovies
                  ? moviesProvider.getPopularMovies()
                  : moviesProvider.getTopRatedMovies();
            }
          }),
        itemCount: movies.length + 1,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          if (index == movies.length) {
            widget.isPopularMovies
                ? moviesProvider.getPopularMovies()
                : moviesProvider.getTopRatedMovies();
            return buildProgressIndicator();
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
}
