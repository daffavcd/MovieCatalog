import 'package:flutter/material.dart';
import '../services/http_service.dart';

class MovieList extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  String result = "";
  HttpService? service;

  @override
  void initState() {
    service = HttpService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    service?.getPopularMovies().then((value) => {
          setState(() {
            result = value;
          })
        });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Movies"),
      ),
      body: Container(
        child: Text(result),
      ),
    );
  }
}
