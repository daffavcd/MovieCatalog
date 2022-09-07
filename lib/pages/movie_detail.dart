import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath!;
    } else {
      path =
          'https://images.freeimages.com/images/large-previewsfleb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.originalTitle!),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                height: height / 1.5,
                child: Image.network(path),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Text('Release Date : ${movie.releaseDate}',
                    style: const TextStyle(fontSize: 16, color: Colors.black)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Text(
                    'Vote Average : ${movie.voteAverage.toString()} /10',
                    style: const TextStyle(fontSize: 16, color: Colors.black)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Text('Language : ${movie.original_language.toString()}',
                    style: const TextStyle(fontSize: 16, color: Colors.black)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 10.0),
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: const Text(
                  "Overview : ",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Text(movie.overview!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
