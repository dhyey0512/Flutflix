import 'package:flutter/material.dart';

class Movie {
  String? title;
  String? overview;
  var backdrop_path;
  int? id;
  var poster_path;
  var release_date;
  var vote_average;

  Movie(
      {required this.title,
      required this.overview,
      required this.backdrop_path,
      required this.id,
      required this.poster_path,
      required this.release_date,
      required this.vote_average});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? "title error",
      overview: json['overview'] ?? "overview error",
      backdrop_path: json['backdrop_path'] ?? "backdrop_path error",
      id: json['id'] ?? "id error",
      release_date: json['release_date'] ?? "release_date error", 
      vote_average: json['vote_average'] ?? "vote_average error",
      poster_path: json['poster_path'],
    );
  }


}
