import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_show/repository/movie_repository.dart';

import '../data/model/movie_model.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final MovieRepository _movieRepository;
  MovieCubit(this._movieRepository) : super(const MovieInitial());
  Future<void> getMovies() async {
    emit(const MovieLoading());
    await _movieRepository.fetchMovies();
    emit(const MovieInitial());
    // emit(Movie);
  }
}
