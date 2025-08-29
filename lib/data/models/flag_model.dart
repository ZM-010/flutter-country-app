class FlagModel{
  final String png;
  final String svg;

  FlagModel({required this.png, required this.svg});

  factory FlagModel.fromJson(Map<String, dynamic> json) {
    return FlagModel(
      png: json['png'] ?? '',
      svg: json['svg'] ?? '',
    );
  }
}