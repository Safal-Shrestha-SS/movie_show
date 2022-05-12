import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_show/database/movie_database.dart';
import 'package:movie_show/repository/movie_repository.dart';
import '../data/model/movie_model.dart';
part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieRepository _movieRepository;
  MovieCubit(this._movieRepository) : super(const MovieInitial());
  Future<void> getMovies() async {
    try {
      emit(const MovieLoading());
      // var movieList = await _movieRepository.fetchMovies();
      await _movieRepository.show();
      // await MovieDatabase.instance.addMovies(movieList);
      emit(const MovieInitial());
      // emit(MovieLoaded(movieList));
    } on Exception {
      emit(const MovieError());
    }
  }
}
