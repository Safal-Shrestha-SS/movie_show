// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Movie {
  final int id;
  final String title;
  final String posterPath;
  final DateTime releaseDate;
  final String overview;
  final double voteAverage;
  final List<int> genreIds;
  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.overview,
    required this.voteAverage,
    required this.genreIds,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        posterPath: json["poster_path"],
        title: json["title"],
        id: json["id"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        releaseDate: DateTime.parse(json["release_date"]),
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'posterPath': posterPath,
      'releaseDate': releaseDate.millisecondsSinceEpoch,
      'overview': overview,
      'voteAverage': voteAverage,
      'genreIds': genreIds,
    };
  }
}
