import 'package:flutter/material.dart';
import '../services/http_service.dart';
import './movie_detail.dart';

class MovieList extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int? moviesCount;
  List? movies;
  HttpService? service;
  String imgPath = 'https://image.tmdb.org/t/p/w185';

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
              leading: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            imgPath + movies?[position].posterPath),
                      ))),
              title: Text(movies?[position].originalTitle),
              subtitle:
                  Text('Rating = ${movies?[position].voteAverage.toString()}'),
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                    builder: (_) => MovieDetail(movies?[position]));
                Navigator.push(context, route);
              },
            ),
          );
        },
      ),
    );
  }
}
