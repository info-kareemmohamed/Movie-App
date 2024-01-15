class TrailersModel {
  final String? title;
  final String? year;
  final String? category;
  final String? type;
  final String? director;
  final String? productionCompany;
  final String? releaseDate;
  final List<String>? stars;

  TrailersModel(
      {this.title,
      this.year,
      this.category,
      this.type,
      this.director,
      this.productionCompany,
      this.releaseDate,
      this.stars});

  factory TrailersModel.fromJson(Map<String, dynamic> json) {
    return TrailersModel(
      title: json['title'],
      category: json['category'],
      director: json['director'],
      productionCompany: json['productionCompany'],
      releaseDate: json['releaseDate'],
      stars: json['stars'] != null ? List<String>.from(json['stars']) : null,
      type: json['type'],
      year: json['year'],
    );
  }
}
