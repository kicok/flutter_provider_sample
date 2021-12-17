import 'dart:convert';

import 'package:flutter_provider_sample/model/movie.dart';
import 'package:http/http.dart' as http;

class MovieRepository {
  var queryParam = {'api_key': '6838131c8fca1012eb55489476bc46f4'};
  Future<List<Movie>> loadMovies() async {
    try {
      var uri = Uri.https('api.themoviedb.org', '/3/movie/popular', queryParam);
      var response = await http.get(uri);
      //if (response.body != null) {
      Map<String, dynamic> body = json.decode(response.body);
      //if (body['results'] != null) {
      List<dynamic> list = body['results'];
      return list.map<Movie>((item) => Movie.fromJson(item)).toList();
      //}
      //}
    } catch (e) {
      rethrow;
    }
  }
}
