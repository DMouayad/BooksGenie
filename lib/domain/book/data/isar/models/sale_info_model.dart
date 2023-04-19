import 'package:books_genie/domain/book/base/entities/base_sale_info.dart';
import 'package:isar/isar.dart';
part 'sale_info_model.g.dart';

@embedded
class SaleInfoModel extends BaseSaleInfo {
  const SaleInfoModel({
    super.country = "",
    super.saleability = "",
    super.isEbook = false,
  });

  factory SaleInfoModel.fromJson(Map<String, dynamic> map) {
    return SaleInfoModel(
      country: map['country'] ?? '',
      saleability: map['saleability'] ?? '',
      isEbook: map['isEbook'] ?? false,
    );
  }
}
