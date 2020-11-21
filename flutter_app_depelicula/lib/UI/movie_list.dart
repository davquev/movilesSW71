import 'package:flutter/material.dart';
import 'package:flutterappdepelicula/models/movie.dart';
import 'package:flutterappdepelicula/util/db_helper.dart';
import 'package:flutterappdepelicula/util/http_helper.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List movies;
  int moviesCount;

  HttpHelper helper;

  Future initialize() async{
    movies = List();
    movies = await helper.getUpcoming();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
}

  @override
  void initState(){
    helper = HttpHelper();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My movies'),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index){
          return MovieRow(movies[index]);
        },
      ),
    );
  }
}

class MovieRow extends StatefulWidget {
  final Movie movie;
  MovieRow(this.movie);

  @override
  _MovieRowState createState() => _MovieRowState(movie);
}

class _MovieRowState extends State<MovieRow> {
  final Movie movie;
  _MovieRowState(this.movie);

  bool favorite;
  DbHelper dbHelper;

  @override
  void initState(){
    favorite = false;
    dbHelper = DbHelper();
    isFavorite(movie);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2.0,
      child: ListTile(
        title: Text(widget.movie.title),
        subtitle: Text(widget.movie.overview),
        trailing: IconButton(
          icon: Icon(Icons.favorite),
          color: favorite ? Colors.red : Colors.grey,
          onPressed: (){
            favorite ? dbHelper.deleteMovie(movie) : dbHelper.insertMovie(movie);
            setState(() {
              favorite = !favorite;
              movie.isFavorite = favorite;
            });
          },
        ),
      ),
    );
  }

  Future isFavorite(Movie movie) async {
    await dbHelper.openDb();
    favorite = await dbHelper.isFavorite(movie);
    setState(() {
      movie.isFavorite = favorite;
    });
  }
}
