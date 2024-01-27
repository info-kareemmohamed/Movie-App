import 'package:hive/hive.dart';

@HiveType(typeId: 1)
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
   List<int>? genreIds;

  @HiveField(5)
   double? voteAverage;

  @HiveField(6)
   String? originCountry;

  @HiveField(7)
  String? release_date;

  MovieFavourite({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.genreIds,
    required this.voteAverage,
    required this.originCountry,
    this.release_date,
  });

  MovieFavourite.fromJson(Map<String, dynamic> json)
      : backdropPath = json['backdrop_path'],
        id = json['id'],
        title = json['title'],
        originalLanguage = json['original_language'],
        genreIds = List<int>.from(json['genre_ids'] ?? []),
        voteAverage = json['vote_average'] != null ? json['vote_average'].toDouble() : 0.0,
        originCountry = json['origin_country'] ,
        release_date = json['release_date'];

  Map<String, dynamic> toJson() {
    return {
      'backdrop_path': backdropPath,
      'id': id,
      'title': title,
      'original_language': originalLanguage,
      'genre_ids': genreIds,
      'vote_average': voteAverage,
      'origin_country': originCountry,
      'release_date': release_date,
    };
  }
}