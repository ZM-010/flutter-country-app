class IddModel {
  final String root;
  final List<String> suffixes;

  IddModel({required this.root, required this.suffixes});

  factory  IddModel.fromJson(Map<String, dynamic> json) {
    return IddModel(
      root: json['root'] ?? '',
      suffixes: List<String>.from(json['suffixes'] ?? []),
    );
  }
}