class CarModel{
  final List<String> signs;
  final String side;

  CarModel({required this.signs, required this.side});

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      signs: List<String>.from(json['signs'] ?? []),
      side: json['side'] ?? '',
    );
  }
}