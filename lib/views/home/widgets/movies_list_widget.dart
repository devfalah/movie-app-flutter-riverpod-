import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/movie.dart';

import '../home_view.dart';
import 'movie_tile.dart';

class MoviesListViewWidget extends StatelessWidget {
  const MoviesListViewWidget({
    Key? key,
    required this.movies,
    required this.deviceHeight,
    required this.deviceWidth,
  }) : super(key: key);
  final List<Movie> movies;
  final double deviceHeight;
  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    if (movies.isNotEmpty) {
      return NotificationListener(
        onNotification: (dynamic _onScrollNotification) {
          if (_onScrollNotification is ScrollEndNotification) {
            final before = _onScrollNotification.metrics.extentBefore;
            final max = _onScrollNotification.metrics.maxScrollExtent;
            if (before == max) {
              context.read(mainPageDataControllerProvider.notifier).getMovies();
              return true;
            }
            return false;
          }
          return false;
        },
        child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (BuildContext _context, int _count) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: deviceHeight * 0.01, horizontal: 0),
              child: Consumer(
                builder: (_, watch, __) => GestureDetector(
                  onTap: () {
                    watch(selectedMoviePosterURLProvider).state =
                        movies[_count].posterURL();
                  },
                  child: MovieTile(
                    movie: movies[_count],
                    height: deviceHeight * 0.20,
                    width: deviceWidth * 0.85,
                  ),
                ),
              ),
            );
          },
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      );
    }
  }
}
