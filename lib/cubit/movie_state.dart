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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieLoaded && listEquals(other.movieList, movieList);
  }

  @override
  int get hashCode => movieList.hashCode;
}

class MovieError extends MovieState {
  const MovieError();
}
