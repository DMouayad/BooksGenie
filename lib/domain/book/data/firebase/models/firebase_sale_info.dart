import 'package:books_genie/domain/book/base/entities/base_sale_info.dart';
import 'package:books_genie/support/utils/extensions.dart';

class FirebaseSaleInfo extends BaseSaleInfo {
  const FirebaseSaleInfo({
    super.saleability,
    super.isEbook,
    super.country,
  });

  factory FirebaseSaleInfo.fromMap(Map<String, dynamic> map) {
    return FirebaseSaleInfo(
      saleability: map.whereKey('saleability'),
      isEbook: map.whereKey('isEbook'),
      country: map.whereKey('country'),
    );
  }

  factory FirebaseSaleInfo.tryFromMap(Map<String, dynamic>? map) {
    return map != null
        ? FirebaseSaleInfo.fromMap(map)
        : const FirebaseSaleInfo();
  }
}
