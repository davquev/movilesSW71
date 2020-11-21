import 'package:flutterappmymovie/models/movie.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper{
  final int version = 1;
  Database db;

  static final DbHelper _dbHelper = DbHelper._internal();
  DbHelper._internal();

  factory DbHelper(){
    return _dbHelper;
  }

  Future<Database> openDB() async{
    if (db == null){
      //no hay bd
      db = await openDatabase(join(await getDatabasesPath(), 'movies.db'),
      onCreate: (db, version){
        db.execute('create table movies(id integer primary key, title text)');
      },version: version);
    }
    //retorna la bd
    return db;
  }

  //insertar movie
Future<int> insertMovie(Movie movie) async{
    int id = await db.insert('movies', movie.toMap(),
  conflictAlgorithm: ConflictAlgorithm.replace);

    return id;
}

  //borrar movie
Future<int> deleteMovie(Movie movie) async{
    int result = await db.delete('movies', where: 'id = ?', whereArgs: [movie.id]);
    return result;
}

  //control de los favoritos
Future<bool> isFavorite(Movie movie) async{
    final List<Map<String, dynamic>> maps =
        await db.query('movies', where: 'id = ?', whereArgs: [movie.id]);
    return maps.length > 0;
}
}