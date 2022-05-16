// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_show/cubit/movie_cubit.dart';
import 'package:movie_show/cubit/switchtheme_cubit.dart';
import '../widgets/error.dart';
import '../widgets/movie_loaded.dart';

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
        backgroundColor: Theme.of(context).primaryColorDark,
        title: const Text('Trending Movies'),
        actions: [
          BlocBuilder<SwitchthemeCubit, SwitchthemeState>(
              builder: (context, state) {
            state as SwitchthemeInitial;
            return IconButton(
              onPressed: () {
                final switchCubit = context.read<SwitchthemeCubit>();
                switchCubit.switchTheme();
              },
              icon: state.isDarkThemeOn
                  ? const Icon(Icons.dark_mode)
                  : const Icon(Icons.light_mode),
            );
          })
        ],
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
