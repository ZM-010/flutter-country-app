class CapitalInfoModel{
  final List<double> latlng;

  CapitalInfoModel({required this.latlng});

  factory CapitalInfoModel.fromJson(Map<String, dynamic> json) {
    return CapitalInfoModel(
      latlng: (json['latlng'] as List?)?.map((e) => (e as num).toDouble()).toList() ?? [],
    );
  }
}