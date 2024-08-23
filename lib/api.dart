import 'dart:convert';
import 'package:movieapp/models/movies.dart';
import 'package:movieapp/trending.dart';
import 'package:http/http.dart' as http;
import 'constants/constant.dart';

class Api {
  static const String trending_url =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constant.apiKey}';

  static const String top_rated =
      "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=vote_average.desc&without_genres=99,10755&vote_count.gte=200&api_key=${Constant.apiKey}";

  static const String upcommingUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constant.apiKey}";

  Future<List<Movie>> getTrending() async {
    final response = await http.get(Uri.parse("$trending_url"));
    if (response.statusCode == 200) {
      final jsonDecoded =
          json.decode(response.body)['results'] as List<dynamic>; // IMp
      print(jsonDecoded);
      return jsonDecoded
          .map((sindex) => Movie.fromJson(sindex))
          .toList(); // IMp
    } else {
      throw Exception("Something happened");
    }
  }

  Future<List<Movie>> getToprated() async {
    final response = await http.get(Uri.parse(top_rated));
    if (response.statusCode == 200) {
      final jsonDecoded =
          json.decode(response.body)['results'] as List<dynamic>; // IMp
      return jsonDecoded
          .map((sindex) => Movie.fromJson(sindex))
          .toList(); // IMp
    } else {
      throw Exception("Something happened");
    }
  }

  Future<List<Movie>> getUpcomming() async {
    final response = await http.get(Uri.parse(upcommingUrl));
    if (response.statusCode == 200) {
      final jsonDecoded =
          json.decode(response.body)['results'] as List<dynamic>; // IMp
      return jsonDecoded
          .map((sindex) => Movie.fromJson(sindex))
          .toList(); // IMp
    } else {
      throw Exception("Something happened");
    }
  }
}
