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
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          child: BlocConsumer(
              builder: ((context, state) {
                if (state is MovieInitial) {
                  return const Center();
                } else {
                  return const Center();
                }
              }),
              listener: (context, state) {})),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
