class TrailersModel {
  final String? name;
  final String? title;
  final String? year;
  final String? category;
  final List<String>? type;
  final String? director;
  final String? productionCompany;
  final String? releaseDate;
  final List<String>? stars;

  TrailersModel(
      {this.name,
      this.title,
      this.year,
      this.category,
      this.type,
      this.director,
      this.productionCompany,
      this.releaseDate,
      this.stars});

  factory TrailersModel.fromJson(Map<String, dynamic> json) {
    return TrailersModel(
      name: json['name'],
      title: json['title'],
      category: json['category'],
      director: json['director'],
      productionCompany: json['productionCompany'],
      releaseDate: json['releaseDate'],
      stars: json['stars'] != null ? List<String>.from(json['stars']) : null,
      type: json['type'] != null ? List<String>.from(json['type']) : null,
      year: json['year'],
    );
  }
}

List<TrailersModel> trailersList = [
  TrailersModel(
    name: 'loki',
    title:
        'The mercurial villain Loki resumes his role as the God of Mischief in a new series that takes place after the events of "Avengers: Endgame".',
    year: '2021',
    type: ['Action', 'Adventure', 'Drama'],
    category: 'Tv Series',
    stars: [
      'Tom Hiddleston',
      'Owen Wilson',
      'Sophia Di Martino',
      'Tara Strong',
    ],
    releaseDate: 'June 9 - 2021',
    productionCompany: 'Marvel Studios',
    director: 'Michael Waldron',
  ),
];
