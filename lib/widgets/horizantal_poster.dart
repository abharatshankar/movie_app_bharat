import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/details_screen.dart';

class HorizantalPoster extends StatelessWidget {
  const HorizantalPoster(
      {Key? key, required this.movie, required this.title, required this.index})
      : super(key: key);

  final Movie movie;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    movie.heroId = '$title-${movie.id}-$index-${movie.id - index}';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, DetailsScreen.routeName,
                arguments: movie),
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/images/no-image.jpg'),
                  image: NetworkImage(movie.fullPosterImg),
                  width: MediaQuery.of(context).size.width - 20,
                  height: 170,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Flexible(
              child: Text(
            movie.title,
            overflow: TextOverflow.fade,
          )),
        ],
      ),
    );
  }
}
