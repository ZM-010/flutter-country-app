class PostalCodeModel{
  final String? format;
  final String? regex;

  PostalCodeModel({this.format, this.regex});

  factory PostalCodeModel.fromJson(Map<String, dynamic> json) {
    return PostalCodeModel(
      format: json['format'],
      regex: json['regex'],
    );
  }
}