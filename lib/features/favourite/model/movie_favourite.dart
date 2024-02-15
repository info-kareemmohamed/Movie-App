
import 'package:hive/hive.dart';

import '../../movie_details/model/MovieDetailsResponse.dart';
part 'movie_favourite.g.dart'; // Generated file

@HiveType(typeId: 2)
class MovieFavourite {
  @HiveField(0)
   String? backdropPath;

  @HiveField(1)
   int? id;

  @HiveField(2)
   String? title;

  @HiveField(3)
   String? originalLanguage;

  @HiveField(4)
  String genre;


  MovieFavourite({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.genre,

  });

  factory  MovieFavourite.fromJson(Map<String, dynamic> json){
    return MovieFavourite(
        backdropPath: json['backdrop_path'],
        id: json['id'],
        title: json['title'],
        originalLanguage: json['original_language'],
        genre:json['genres'][0]["name"]
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'backdrop_path': backdropPath,
      'id': id,
      'title': title,
      'original_language': originalLanguage,
      'genre_ids': genre,

    };
  }
}
