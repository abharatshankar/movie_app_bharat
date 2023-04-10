import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:movie_app/helpers/constants.dart';
import 'package:movie_app/models/models.dart';
import '../screens/details_screen.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movies.isEmpty) {
      return SizedBox(
        width: size.width,
        height: size.height * 0.55,
        child: const Center(
            child: CircularProgressIndicator(color: Colors.indigo)),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 15),
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (_, int index) {
          final movie = movies[index];
          movie.heroId = 'swiper-${movie.id}';

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, DetailsScreen.routeName,
                arguments: movie),
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage(StrConstants.noImgIcon),
                  image: NetworkImage(movie.fullPosterImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
