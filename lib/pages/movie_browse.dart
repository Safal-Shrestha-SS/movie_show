// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:movie_show/cubit/movie_cubit.dart';
import 'package:movie_show/data/constants.dart';
import 'package:movie_show/pages/movie.dart';
import 'package:movie_show/routes.dart';

import '../data/model/movie_model.dart';

class MovieBrowse extends StatefulWidget {
  const MovieBrowse({Key? key}) : super(key: key);

  @override
  State<MovieBrowse> createState() => _MovieBrowseState();
}

class _MovieBrowseState extends State<MovieBrowse> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Movies'),
      ),
      body: BlocConsumer<MovieCubit, MovieState>(
        listener: ((context, state) {}),
        builder: ((context, state) {
          if (state is MovieInitial) {
            final movieCubit = context.read<MovieCubit>();
            movieCubit.getMovies();
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MovieLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MovieLoaded) {
            return MovieLoadedState(
              movieList: state.movieList,
            );
          } else {
            return const ErrorState();
          }
        }),
      ),
    );
  }
}

class ErrorState extends StatelessWidget {
  const ErrorState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Sorry, Some Error Occured'));
  }
}

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
              child: Card(
                elevation: 8.sp,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Badge(
                        position:
                            BadgePosition.bottomStart(bottom: -7.h, start: 2.w),
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
            );
          });
    });
  }
}
