import 'package:flutter/material.dart';
import 'package:movie_show/cubit/movie_cubit.dart';
import 'package:movie_show/pages/movie_browse.dart';
import 'package:movie_show/repository/movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (context) => MovieCubit(RealMovieRepostoty()),
          child: const MovieBrowse()),
    );
  }
}
