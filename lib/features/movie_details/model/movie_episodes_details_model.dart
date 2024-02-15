class MovieDetailsModel {
  final String? title;
  final String? subTitle;
  final num? rate;

  MovieDetailsModel({
    required this.title,
    required this.subTitle,
    required this.rate,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      title: json['title'],
      subTitle: json['subtitle'],
      rate: json['rate'],
    );
  }
}
