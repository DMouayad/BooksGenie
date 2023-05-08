import 'base_book_info.dart';
import 'base_sale_info.dart';

abstract class BaseBook<I extends BaseBookInfo, S extends BaseSaleInfo> {
  final String? id;
  final String? etag;

  /// A self link containing more specific information
  final Uri? selfLink;

  /// The information about the book
  final I info;

  /// The information about the book's sale info
  final S saleInfo;

  BaseBook({
    this.etag,
    this.selfLink,
    this.id,
    required this.info,
    required this.saleInfo,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseBook &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          etag == other.etag &&
          selfLink == other.selfLink &&
          info == other.info &&
          saleInfo == other.saleInfo;

  @override
  int get hashCode =>
      etag.hashCode ^
      id.hashCode ^
      selfLink.hashCode ^
      info.hashCode ^
      saleInfo.hashCode;

  @override
  String toString() => info.title;
}
