import 'package:flutter/material.dart';
import 'package:movie_show/pages/movie.dart';
import 'package:movie_show/pages/movie_browse.dart';

class RouteGenerator {
  static const String page2 = '/page2';
  static const String page1 = '/';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case (page1):
        return MaterialPageRoute(builder: (_) => const MovieBrowse());

      case (page2):
        if (args is MovieArguments) {
          return MaterialPageRoute(
              builder: (_) => MovieInfo(
                      data: MovieArguments(
                    date: args.date,
                    overview: args.overview,
                    posterPath: args.posterPath,
                    title: args.title,
                    vote: args.vote,
                  )));
        } else {
          return MaterialPageRoute(
              builder: (_) => Scaffold(
                    body: Center(
                        child: Text('No route defined for ${settings.name}')),
                  ));
        }

      default:
        return _errorRoute(settings.name.toString());
    }
  }

  static Route<dynamic> _errorRoute(String name) {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body: Center(child: Text('No route defined for $name')),
            ));
  }
}
