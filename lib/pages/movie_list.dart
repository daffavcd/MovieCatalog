import 'package:flutter/material.dart';
import '../services/http_service.dart';

class MovieList extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int? moviesCount;
  List? movies;
  HttpService? service;

  Future initialize() async {
    movies = [];
    movies = await service?.getPopularMovies();
    setState(() {
      moviesCount = movies?.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Movies"),
      ),
      body: ListView.builder(
        itemCount: (moviesCount == null) ? 0 : moviesCount,
        itemBuilder: (context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              title: Text(movies?[position].originalTitle),
              subtitle:
                  Text('Rating = ${movies?[position].voteAverage.toString()}'),
            ),
          );
        },
      ),
    );
  }
}
