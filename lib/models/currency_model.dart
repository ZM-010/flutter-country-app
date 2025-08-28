class CurrencyModel {
  final String symbol;
  final String name;

  CurrencyModel({required this.symbol, required this.name});

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      symbol: json['symbol'] ?? '',
      name: json['name'] ?? '',
    );
  }
}