import 'package:dio/dio.dart';

import '../data/model/movie_model.dart';
// import 'package:movie_show/data/model/movie_model.dart';

class MovieApi {
  final dio = Dio();

  Future<List<Movie>> getTrendingMovies() async {
    List<Movie> moviesList = [];
    try {
      final movieList = await dio.get(
          'https://api.themoviedb.org/3/trending/movie/day?api_key=5808dfd228b882a250625610a099dabd');
      final movieModel = movieList.data['results'];
      // ignore: avoid_print
      // print(movieModel[0]);
      movieModel.forEach((item) {
        final movie = Movie.fromJson(item);
        moviesList.add(movie);
      });
      return moviesList;
    } on Exception {
      throw Exception();
    }
  }
}
