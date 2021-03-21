import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz_unsafe.dart';
import 'package:http/http.dart' as http;

import 'api_key.dart';

class Movie {
  final String title, posterPath, overview;
  Movie(this.overview, this.posterPath, this.title);

  Movie.fromJson(Map json)
      : title = json['title'],
        posterPath = json['poster_path'],
        overview = json['overview'];
}

class API {
  final http.Client _client = http.Client();
  static const String _url =
      'https://api.themoviedb.org/3/movie/550?api_key=${ApiKey.MOVIEDB_APIKEY}';

  Future<List<Movie>> get(String query) async {
    List<Movie> list = [];
    await _client
        .get(Uri.parse(_url.replaceFirst("{1}", query)))
        .then((value) => value.body)
        .then(json.decode)
        .then((json) => json["results"])
        .then((movies) =>
            movies.forEach((movie) => list.add(Movie.fromJson(movie))));
    return list;
  }
}
