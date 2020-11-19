import 'package:flutter/material.dart';
import 'package:flutterappmymovie/utils/http_helper.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List movies;
  int moviesCount;

  HttpHelper helper;

  Future initialize() async {
    movies = List();
    movies = await helper.getUpcoming();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    helper = HttpHelper();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My movies!!!'),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index){
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              title: Text(movies[index].title),
              subtitle: Text(movies[index].overview),
            ),
          );
        },
      ),
    );
  }
}
