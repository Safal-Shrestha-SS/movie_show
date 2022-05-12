import 'package:dio/dio.dart';
// import 'package:movie_show/data/model/movie_model.dart';

class MovieApi {
  final dio = Dio();
  Future<void> getTrendingMovies() async {
    try {
      final movieList = await dio.get(
          'https://api.themoviedb.org/3/trending/all/day?api_key=5808dfd228b882a250625610a099dabd');
      final movieModel = movieList.data;
      // ignore: avoid_print
      print(movieModel);
    } on Exception {
      throw Exception();
    }
  }
}
