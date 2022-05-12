import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
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
  }
}
