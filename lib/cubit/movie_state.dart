// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'movie_cubit.dart';

@immutable
abstract class MovieState {
  const MovieState();
}

class MovieInitial extends MovieState {
  const MovieInitial();
}

class MovieLoading extends MovieState {
  const MovieLoading();
}

class MovieLoaded extends MovieState {
  final List<Movie> movieList;
  const MovieLoaded(this.movieList);
}

class MovieError extends MovieState {
  const MovieError();
}
