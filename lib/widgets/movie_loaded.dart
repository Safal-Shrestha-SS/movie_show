import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../data/constants.dart';
import '../data/model/movie_model.dart';
import '../pages/movie.dart';
import '../routes.dart';

class MovieLoadedState extends StatefulWidget {
  final List<Movie> movieList;

  const MovieLoadedState({
    Key? key,
    required this.movieList,
  }) : super(key: key);

  @override
  State<MovieLoadedState> createState() => _MovieLoadedStateState();
}

class _MovieLoadedStateState extends State<MovieLoadedState> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context) {
      // designSize:
      // const Size(360, 752);
      return MasonryGridView.count(
          itemCount: widget.movieList.length,
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemBuilder: (context, index) {
            var movie = widget.movieList[index];
            var date = movie.releaseDate;
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(RouteGenerator.page2,
                    arguments: MovieArguments(
                        posterPath: movie.posterPath,
                        title: movie.title,
                        date: movie.releaseDate,
                        vote: movie.voteAverage,
                        overview: movie.overview));
              },
              child: Hero(
                tag: movie.title,
                child: Card(
                  color: Theme.of(context).primaryColor,
                  elevation: 8.sp,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Badge(
                          badgeColor: Theme.of(context).secondaryHeaderColor,
                          position: BadgePosition.bottomStart(
                              bottom: -7.h, start: 2.w),
                          badgeContent: Text(movie.voteAverage.toString()),
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl: imageURL + movie.posterPath,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    LinearProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        Center(
                          child: Text(
                            movie.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Center(
                          child: Text(
                              " ${months[date.month]}-${date.day.toString()}-${date.year.toString()}"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
    });
  }
}
