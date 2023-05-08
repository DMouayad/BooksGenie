import 'package:books_genie/support/utils/extensions.dart';

import 'base_cover_image_link.dart';
import 'base_industry_identifier.dart';

abstract class BaseBookInfo<I extends BaseIndustryIdentifier,
    C extends BaseCoverImageLink> {
  final List<String> authors;
  final double averageRating;
  final List<String> categories;
  final String contentVersion;
  final String description;
  Map<String, Uri> get imageLinks {
    return Map.fromEntries(
      coverImageLinks.map((e) => MapEntry(e.size.name, Uri.parse(e.url!))),
    );
  }

  String? get smallThumbnailImageLink {
    return coverImageLinks.firstWhereAnyOrNull((element) {
      return [
        element.size == BookCoverSize.smallThumbnail,
        element.size == BookCoverSize.mediumThumbnail,
        element.size == BookCoverSize.small
      ];
    })?.url;
  }

  String? get thumbnailImageLink {
    return coverImageLinks.firstWhereOrNull((element) {
      return element.size == BookCoverSize.defaultThumbnail;
    })?.url;
  }

  final Uri? canonicalVolumeLink;
  final Uri? infoLink;
  // final String canonicalVolumeLinkString;
  // final String infoLinkString;
  // final String previewLinkString;
  // final String reviewsLinkString;
  final Uri? previewLink;
  final Uri? reviewsLink;
  final List<C> coverImageLinks;

  final List<I> industryIdentifiers;
  final String language;
  final String maturityRating;
  final int pageCount;
  final DateTime? publishedDate;
  final String publisher;
  final int ratingsCount;
  final String rawPublishedDate;
  final String subtitle;
  final String title;

  const BaseBookInfo({
    this.title = "",
    this.subtitle = "",
    this.authors = const [],
    this.publisher = "",
    this.reviewsLink,
    this.averageRating = 0.0,
    this.categories = const [],
    this.contentVersion = "",
    this.description = "",
    this.industryIdentifiers = const [],
    this.coverImageLinks = const [],
    this.language = "",
    this.maturityRating = "",
    this.pageCount = 0,
    this.publishedDate,
    this.rawPublishedDate = "",
    this.ratingsCount = 0,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'authors': authors,
      'publisher': publisher,
      'publishedDate': publishedDate,
      'rawPublishedDate': rawPublishedDate,
      'averageRating': averageRating,
      'coverImageLinks': coverImageLinks.map((e) => e.toMap()).toList(),
      'categories': categories,
      'contentVersion': contentVersion,
      'description': description,
      'language': language,
      'maturityRating': maturityRating,
      'pageCount': pageCount,
      'ratingsCount': ratingsCount,
      'imageLinks': imageLinks,
      'industryIdentifiers':
          industryIdentifiers.map((identifier) => identifier.toMap()).toList(),
      'previewLink': previewLink.toString(),
      'infoLink': infoLink.toString(),
      'reviewsLink': reviewsLink.toString(),
      'canonicalVolumeLink': canonicalVolumeLink.toString(),
    };
  }

  @override
  String toString() {
    return 'BookInfoModel(title: $title, subtitle: $subtitle authors: $authors, publisher: $publisher, publishedDate: $publishedDate, rawPublishedDate: $rawPublishedDate, description: $description, industryIdentifiers: $industryIdentifiers, pageCount: $pageCount, categories: $categories, averageRating: $averageRating, ratingsCount: $ratingsCount, maturityRating: $maturityRating, contentVersion: $contentVersion, imageLinks: $imageLinks, language: $language, previewLink: $previewLink, infoLink: $infoLink, canonicalVolumeLink: $canonicalVolumeLink)';
  }

  copyWith({
    List<String>? authors,
    double? averageRating,
    String? canonicalVolumeLinkString,
    List<String>? categories,
    String? contentVersion,
    String? description,
    List<C>? coverImageLinks,
    List<I>? industryIdentifiers,
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
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseBookInfo &&
          runtimeType == other.runtimeType &&
          authors == other.authors &&
          averageRating == other.averageRating &&
          canonicalVolumeLink == other.canonicalVolumeLink &&
          categories == other.categories &&
          contentVersion == other.contentVersion &&
          description == other.description &&
          coverImageLinks == other.coverImageLinks &&
          industryIdentifiers == other.industryIdentifiers &&
          infoLink == other.infoLink &&
          language == other.language &&
          maturityRating == other.maturityRating &&
          pageCount == other.pageCount &&
          previewLink == other.previewLink &&
          publishedDate == other.publishedDate &&
          publisher == other.publisher &&
          ratingsCount == other.ratingsCount &&
          rawPublishedDate == other.rawPublishedDate &&
          subtitle == other.subtitle &&
          title == other.title &&
          reviewsLink == other.reviewsLink;

  @override
  int get hashCode =>
      authors.hashCode ^
      averageRating.hashCode ^
      canonicalVolumeLink.hashCode ^
      categories.hashCode ^
      contentVersion.hashCode ^
      description.hashCode ^
      coverImageLinks.hashCode ^
      industryIdentifiers.hashCode ^
      infoLink.hashCode ^
      language.hashCode ^
      maturityRating.hashCode ^
      pageCount.hashCode ^
      previewLink.hashCode ^
      publishedDate.hashCode ^
      publisher.hashCode ^
      ratingsCount.hashCode ^
      rawPublishedDate.hashCode ^
      subtitle.hashCode ^
      reviewsLink.hashCode ^
      title.hashCode;
}
