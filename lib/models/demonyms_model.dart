class DemonymsModel{
  final Map<String, dynamic> eng;
  final Map<String, dynamic>? fra;

  DemonymsModel({required this.eng, this.fra});

  factory DemonymsModel.fromJson(Map<String, dynamic> json) {
    return DemonymsModel(
      eng: json['eng'] ?? {},
      fra: json['fra'],
    );
  }
}