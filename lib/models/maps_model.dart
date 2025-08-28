class MapsModel{
  final String googleMaps;
  final String openStreetMaps;

  MapsModel({required this.googleMaps, required this.openStreetMaps});

  factory MapsModel.fromJson(Map<String, dynamic> json) {
    return MapsModel(
      googleMaps: json['googleMaps'] ?? '',
      openStreetMaps: json['openStreetMaps'] ?? '',
    );
  }
}