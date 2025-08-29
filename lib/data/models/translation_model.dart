class TranslationModel {
  final String official;
  final String common;

  TranslationModel({required this.official, required this.common});

  factory TranslationModel.fromJson(Map<String, dynamic> json) {
    return TranslationModel(
      official: json['official'] ?? '',
      common: json['common'] ?? '',
    );
  }
}
