import 'package:flutter/foundation.dart';
import 'package:flutter_provider_sample/model/movie.dart';
import 'package:flutter_provider_sample/repository/movie_repository.dart';

class MovieProvider extends ChangeNotifier {
  //List<Map<String, dynamic>> _movies = [];
  List<Movie> _movies = [];
  final MovieRepository _movieRepository = MovieRepository();

  List<Movie> get movies => _movies;

  loadMovies() async {
    List<Movie> listMovies = await _movieRepository.loadMovies();

    // 중간에 listMovies에 대한 예외처리코딩
    // 추가적인 가공처리
    _movies = listMovies;
    notifyListeners();
  }
}
