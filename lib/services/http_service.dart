import 'dart:io';
import 'package:http/http.dart' as http;

class HttpService {
  final String apiKey = 'eee6c4bddcfc3ad6c1ab64c445e68585';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<String> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      String jsonResponse = result.body;
      return jsonResponse;
    } else {
      print("Fail");
      return "Fail";
    }
  }
}
