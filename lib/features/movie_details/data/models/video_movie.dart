class MovieDetail {
  int id;
  List<MovieResult> results;

  MovieDetail({required this.id, required this.results});

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      id: json['id'],
      results: (json['results'] as List)
          .map((result) => MovieResult.fromJson(result))
          .toList(),
    );
  }
}

class MovieResult {
  String iso6391;
  String iso31661;
  String name;
  String key;
  String site;
  int size;
  String type;
  bool official;
  DateTime publishedAt;
  String id;

  MovieResult({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  factory MovieResult.fromJson(Map<String, dynamic> json) {
    return MovieResult(
      iso6391: json['iso_639_1'],
      iso31661: json['iso_3166_1'],
      name: json['name'],
      key: json['key'],
      site: json['site'],
      size: json['size'],
      type: json['type'],
      official: json['official'],
      publishedAt: DateTime.parse(json['published_at']),
      id: json['id'],
    );
  }
}