import 'package:flutter/material.dart';
import 'package:movie_show/cubit/movie_cubit.dart';
import 'package:movie_show/cubit/switchtheme_cubit.dart';
import 'package:movie_show/pages/movie_browse.dart';
import 'package:movie_show/repository/movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_show/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieCubit>(
          create: (context) => MovieCubit(RealMovieRepostoty()),
          child: const MovieBrowse(),
        ),
        BlocProvider<SwitchthemeCubit>(
          create: (context) => SwitchthemeCubit(),
          child: const MovieBrowse(),
        ),
      ],
      child: BlocBuilder<SwitchthemeCubit, SwitchthemeState>(
          builder: (context, state) {
        state as SwitchthemeInitial;
        return MaterialApp(
            onGenerateRoute: RouteGenerator.generateRoute,
            title: 'Flutter Demo',
            initialRoute: RouteGenerator.page1,
            theme: state.theme);
      }),
    );
  }
}
