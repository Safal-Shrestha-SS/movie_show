import 'package:movie_show/api/movie_api.dart';
import 'package:movie_show/data/model/movie_model.dart';

import '../database/movie_database.dart';

abstract class MovieRepository {
  Future<List<Movie>> fetchMovies();
  Future<List<Movie>> show();
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
  Future<List<Movie>> show() async {
    var movie = await movieDatabase.getMovies();
    return movie;
  }
}
