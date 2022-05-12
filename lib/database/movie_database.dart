import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../data/model/movie_model.dart';
// import 'package:sqflite/sqlite_api.dart';

class MovieDatabase {
  MovieDatabase._createInstance();
  static final MovieDatabase instance = MovieDatabase._createInstance();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await createDatabase();
    return _database!;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "Movie.db");
    var database = await openDatabase(path, version: 1, onCreate: _onCreate);
    return database;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE movies(
      id INTEGER PRIMARY KEY,
      title text,
      posterPath text,
      overview text,
      releaseDate text,
      voteAverage real,
      genreIds text

    )
''');
    print('database created');
  }

  Future<void> addMovies(List<Movie> movieLists) async {
    Database db = await instance.database;
    await db.rawDelete('''DELETE FROM movies''');
    for (var element in movieLists) {
      // print(element.title);

      print(element.title);
      await db.insert('movies', {
        'id': '${element.id}',
        'title': element.title,
        'posterPath': element.posterPath,
        'overview': element.overview,
        'releaseDate': '${element.releaseDate}',
        'voteAverage': '${element.voteAverage}',
        'genreIds': '${element.genreIds}'
      });
//       await db.rawInsert('''
// INSERT INTO movies (id,title,posterPath,overview,releaseDate,voteAverage,genreIds)
// VALUES('${element.id}','${element.title}', '${element.posterPath}', '${element.overview}', '${element.releaseDate}','${element.voteAverage}','${element.genreIds}');
// ''');
      // }
    }
  }

  Future<List<Movie>> getMovies() async {
    Database db = await instance.database;
    List<Movie> movieList = [];

    var movie = await db.query('movies');

    for (var element in movie) {
      var genres = element['genreIds'].toString();
      List<int> list = json.decode(genres).cast<int>();

      movieList.add(Movie(
          id: int.parse(element['id'].toString()),
          overview: element['overview'].toString(),
          posterPath: element['posterPath'].toString(),
          releaseDate: DateTime.parse(element['releaseDate'].toString()),
          title: element['title'].toString(),
          voteAverage: double.parse(element['voteAverage'].toString()),
          genreIds: list));
    }
    // List<Movie> movieList =

    return movieList;
  }
}
