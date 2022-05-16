import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_show/cubit/movie_cubit.dart';

class MovieBrowse extends StatefulWidget {
  const MovieBrowse({Key? key}) : super(key: key);

  @override
  State<MovieBrowse> createState() => _MovieBrowseState();
}

class _MovieBrowseState extends State<MovieBrowse> {
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
            return const Center(
              child: CityInputField(),
            );
          } else if (state is MovieLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MovieLoaded) {
            return const CityInputField();
          } else {
            return const CityInputField();
          }
        }),
      ),
    );
  }
}

class CityInputField extends StatelessWidget {
  const CityInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.red, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: () {
          getData(context);
        },
        child: const Text('Get'),
      ),
    );
  }

  void getData(BuildContext context) {
    final movieCubit = context.read<MovieCubit>();
    // print('clicked');
    movieCubit.getMovies();
  }
}
