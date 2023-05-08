import 'package:books_finder/books_finder.dart';
import 'package:books_genie/domain/book/base/entities/base_book.dart';
import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

import 'book_info_model.dart';
import 'cover_image_link.dart';
import 'industry_identifier_model.dart';
import 'sale_info_model.dart';

part 'book_model.g.dart';

@Collection(ignore: {'selfLink', 'props', 'stringify'})
class BookModel extends BaseBook<BookInfoModel, SaleInfoModel>
    with EquatableMixin {
  Id? isarId;
  @override
  @Index(type: IndexType.value)
  String? get id;

  BookModel({
    super.id,
    super.etag,
    super.selfLink,
    required super.info,
    required super.saleInfo,
  });

  factory BookModel.fromGoogleBook(Book book) {
    return BookModel(
      id: book.id,
      info: BookInfoModel.fromGoogleBookInfo(book.info),
      saleInfo: SaleInfoModel(
        country: book.saleInfo.country,
        isEbook: book.saleInfo.isEbook,
        saleability: book.saleInfo.saleability,
      ),
      selfLink: book.selfLink,
    );
  }

  @override
  @ignore
  List<Object?> get props => [info, saleInfo, id, selfLink, etag, id];
}
