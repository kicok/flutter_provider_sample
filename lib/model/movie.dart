class Movie {
  late final String overview;
  late final String posterPath;
  late final String title;

  Movie({
    required this.overview,
    required this.posterPath,
    required this.title,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        overview: json['overview'],
        posterPath: json['poster_path'],
        title: json['title']);
  }

  String get postUrl => 'https://image.tmdb.org/t/p/w500/$posterPath';
}
