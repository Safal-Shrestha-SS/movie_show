import 'package:movie_show/api/movie_api.dart';
import 'package:movie_show/data/model/movie_model.dart';

import '../database/movie_database.dart';

abstract class MovieRepository {
  Future<List<Movie>> fetchMovies();
  Future<void> show();
}

class RealMovieRepostoty extends MovieRepository {
  final MovieApi movieApi = MovieApi();
  MovieDatabase movieDatabase = MovieDatabase.instance;

  @override
  Future<List<Movie>> fetchMovies() async {
    var movieList = await movieApi.getTrendingMovies();
    await movieDatabase.addMovies(movieList);
    return movieList;
  }

  @override
  Future<void> show() async {
    var movie = await movieDatabase.getMovies();
    movie.forEach((element) {
      print('${element.releaseDate}   ${element.title}');
    });
  }
}
