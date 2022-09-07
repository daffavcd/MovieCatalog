class Movie {
  int? id;
  String? originalTitle;
  double? voteAverage;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? original_language;

  Movie(this.id, this.originalTitle, this.voteAverage, this.overview,
      this.posterPath, this.releaseDate, this.original_language);

  Movie.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    originalTitle = parsedJson['original_title'];
    voteAverage = parsedJson['vote_average'] * 1.0;
    overview = parsedJson['overview'];
    posterPath = parsedJson['poster_path'];
    releaseDate = parsedJson['release_date'];
    original_language = parsedJson['original_language'];
  }
}
