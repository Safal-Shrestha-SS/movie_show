import 'package:movie_show/api/movie_api.dart';

abstract class MovieRepository {
  Future<void> fetchMovies();
}

class RealMovieRepostoty extends MovieRepository {
  final MovieApi movieApi = MovieApi();
  @override
  Future<void> fetchMovies() async {
    await movieApi.getTrendingMovies();
  }
}
