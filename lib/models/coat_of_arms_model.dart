class CoatOfArmsModel {
  final String png;
  final String svg;

  CoatOfArmsModel({required this.png, required this.svg});

  factory CoatOfArmsModel.fromJson(Map<String, dynamic> json) {
    return CoatOfArmsModel(
      png: json['png'] ?? '',
      svg: json['svg'] ?? '',
    );
  }
}