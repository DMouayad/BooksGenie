abstract class BaseSaleInfo {
  final String country;
  final String saleability;
  final bool isEbook;

  const BaseSaleInfo({
    this.country = "",
    this.saleability = "",
    this.isEbook = false,
  });

  @override
  String toString() =>
      'SaleInfo(country: $country, saleability: $saleability, isEbook: $isEbook)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BaseSaleInfo &&
        other.country == country &&
        other.saleability == saleability &&
        other.isEbook == isEbook;
  }

  @override
  int get hashCode =>
      country.hashCode ^ saleability.hashCode ^ isEbook.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'saleability': saleability,
      'isEbook': isEbook,
    };
  }
}
