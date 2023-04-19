import 'package:books_finder/books_finder.dart';
import 'package:books_genie/domain/book/base/entities/base_book_info.dart';
import 'package:books_genie/domain/book/utils/enums/book_cover_size.dart';
import 'package:isar/isar.dart';
import 'package:books_genie/domain/book/data/isar/models/cover_image_link.dart';
import 'industry_identifier_model.dart';
part 'book_info_model.g.dart';

@Embedded(ignore: {
  'canonicalVolumeLink',
  'imageLinks',
  'thumbnailImageLink',
  'infoLink',
  'previewLink',
  'reviewsLink'
})
class BookInfoModel
    extends BaseBookInfo<IndustryIdentifierModel, CoverImageLinkModel> {
  const BookInfoModel({
    super.title = "",
    super.subtitle = "",
    super.authors = const [],
    super.publisher = "",
    super.averageRating = 0.0,
    super.categories = const [],
    super.contentVersion = "",
    super.description = "",
    super.industryIdentifiers = const [],
    super.coverImageLinks = const [],
    super.language = "",
    super.maturityRating = "",
    super.pageCount = 0,
    super.publishedDate,
    super.rawPublishedDate = "",
    super.ratingsCount = 0,
    this.reviewsLinkString = "",
    this.previewLinkString = "",
    this.infoLinkString = "",
    this.canonicalVolumeLinkString = '',
  });

  final String canonicalVolumeLinkString;
  final String infoLinkString;
  final String previewLinkString;
  final String reviewsLinkString;

  @override
  Uri? get canonicalVolumeLink => Uri.tryParse(canonicalVolumeLinkString);
  @override
  Uri? get infoLink => Uri.tryParse(infoLinkString);
  @override
  Uri? get previewLink => Uri.tryParse(previewLinkString);
  @override
  Uri? get reviewsLink => Uri.tryParse(reviewsLinkString);

  factory BookInfoModel.fromGoogleBookInfo(BookInfo bookInfo) {
    return BookInfoModel(
      title: bookInfo.title,
      subtitle: bookInfo.subtitle,
      authors: bookInfo.authors,
      averageRating: bookInfo.averageRating,
      categories: bookInfo.categories,
      contentVersion: bookInfo.contentVersion,
      pageCount: bookInfo.pageCount,
      ratingsCount: bookInfo.ratingsCount,
      description: bookInfo.description,
      canonicalVolumeLinkString: bookInfo.canonicalVolumeLink.toString(),
      coverImageLinks: bookInfo.imageLinks.entries
          .map(
            (entry) => CoverImageLinkModel(
                url: entry.value.toString(),
                size: BookCoverSize.from(entry.key)),
          )
          .toList(),
      language: bookInfo.language,
      maturityRating: bookInfo.maturityRating,
      publishedDate: bookInfo.publishedDate,
      rawPublishedDate: bookInfo.rawPublishedDate,
      previewLinkString: bookInfo.previewLink.toString(),
      infoLinkString: bookInfo.infoLink.toString(),
      industryIdentifiers: bookInfo.industryIdentifiers
          .map((e) =>
              IndustryIdentifierModel(type: e.type, identifier: e.identifier))
          .toList(),
      publisher: bookInfo.publisher,
    );
  }

  @override
  BookInfoModel copyWith({
    List<String>? authors,
    double? averageRating,
    String? canonicalVolumeLinkString,
    List<String>? categories,
    String? contentVersion,
    String? description,
    List<CoverImageLinkModel>? coverImageLinks,
    List<IndustryIdentifierModel>? industryIdentifiers,
    String? infoLinkString,
    String? language,
    String? maturityRating,
    int? pageCount,
    String? previewLinkString,
    DateTime? publishedDate,
    String? publisher,
    int? ratingsCount,
    String? rawPublishedDate,
    String? subtitle,
    String? title,
    String? reviewsLinkString,
  }) {
    return BookInfoModel(
      authors: authors ?? this.authors,
      averageRating: averageRating ?? this.averageRating,
      canonicalVolumeLinkString:
          canonicalVolumeLinkString ?? this.canonicalVolumeLinkString,
      categories: categories ?? this.categories,
      contentVersion: contentVersion ?? this.contentVersion,
      description: description ?? this.description,
      coverImageLinks: coverImageLinks ?? this.coverImageLinks,
      industryIdentifiers: industryIdentifiers ?? this.industryIdentifiers,
      infoLinkString: infoLinkString ?? this.infoLinkString,
      language: language ?? this.language,
      maturityRating: maturityRating ?? this.maturityRating,
      pageCount: pageCount ?? this.pageCount,
      previewLinkString: previewLinkString ?? this.previewLinkString,
      publishedDate: publishedDate ?? this.publishedDate,
      publisher: publisher ?? this.publisher,
      ratingsCount: ratingsCount ?? this.ratingsCount,
      rawPublishedDate: rawPublishedDate ?? this.rawPublishedDate,
      subtitle: subtitle ?? this.subtitle,
      title: title ?? this.title,
    );
  }
}
