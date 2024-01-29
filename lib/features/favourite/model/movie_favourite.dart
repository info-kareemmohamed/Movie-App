import 'package:hive/hive.dart';
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
   List<String>? genres;


  MovieFavourite({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.genres,

  });

  MovieFavourite.fromJson(Map<String, dynamic> json)
      : backdropPath = json['backdrop_path'],
        id = json['id'],
        title = json['title'],
        originalLanguage = json['original_language'],
        genres = List<String>.from(json['genre_ids'] ?? []);


  Map<String, dynamic> toJson() {
    return {
      'backdrop_path': backdropPath,
      'id': id,
      'title': title,
      'original_language': originalLanguage,
      'genre_ids': genres,

    };
  }
}