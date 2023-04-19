import 'package:books_genie/domain/book/base/entities/base_book_info.dart';
import 'package:books_genie/domain/book/base/entities/base_cover_image_link.dart';
import 'package:books_genie/domain/book/base/entities/base_industry_identifier.dart';
import 'package:books_genie/support/utils/extensions.dart';

class FirebaseBookInfo
    extends BaseBookInfo<FirebaseIndustryIdentifier, FirebaseCoverImageLink> {
  @override
  copyWith({
    List<String>? authors,
    double? averageRating,
    String? canonicalVolumeLinkString,
    List<String>? categories,
    String? contentVersion,
    String? description,
    List<FirebaseCoverImageLink>? coverImageLinks,
    List<FirebaseIndustryIdentifier>? industryIdentifiers,
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
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  factory FirebaseBookInfo.tryFromMap(Map<String, dynamic>? map) {
    return map != null
        ? FirebaseBookInfo.fromMap(map)
        : const FirebaseBookInfo();
  }
  const FirebaseBookInfo({
    super.title = "",
    super.subtitle = "",
    super.authors = const [],
    super.publisher = "",
    super.reviewsLink,
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
    super.previewLink,
    super.infoLink,
    super.canonicalVolumeLink,
  });
  factory FirebaseBookInfo.fromMap(Map<String, dynamic> map) {
    final List<FirebaseCoverImageLink> coverImageLinks =
        map.containsKey('coverImageLinks')
            ? _getItemsFromList(
                map['coverImageLinks'],
                (map) => FirebaseCoverImageLink.fromMap(map),
              )
            : (map.whereKey('imageLinks') as Map<String, dynamic>?)
                    ?.entries
                    .map(
                      (entry) => FirebaseCoverImageLink(
                          url: entry.value.toString(),
                          size: BookCoverSize.from(entry.key)),
                    )
                    .toList() ??
                [];
    return FirebaseBookInfo(
      authors: List.from(map['authors']).map((e) => e.toString()).toList(),
      averageRating: map['averageRating'] as double,
      categories:
          List.from(map['categories']).map((e) => e.toString()).toList(),
      contentVersion: map['contentVersion'] as String,
      description: map['description'] as String,
      coverImageLinks: coverImageLinks,
      industryIdentifiers: _getItemsFromList(
        map['industryIdentifiers'],
        (map) => FirebaseIndustryIdentifier.fromMap(map),
      ),
      infoLink: _getUriFromMap(map, 'infoLink'),
      canonicalVolumeLink: _getUriFromMap(map, 'canonicalVolumeLink'),
      previewLink: _getUriFromMap(map, 'previewLink'),
      reviewsLink: _getUriFromMap(map, 'reviewsLink'),
      language: map['language'] as String,
      maturityRating: map['maturityRating'] as String,
      pageCount: map['pageCount'] as int,
      publisher: map['publisher'] as String,
      ratingsCount: map['ratingsCount'] as int,
      rawPublishedDate: map['rawPublishedDate'],
      subtitle: map['subtitle'] as String,
      title: map['title'] as String,
    );
  }
  static List<T> _getItemsFromList<T>(
    dynamic data,
    T Function(Map<String, dynamic> map) mapper,
  ) {
    var result = <T>[];
    if (data is List) {
      for (var element in data) {
        if (element is Map<String, dynamic>) result.add(mapper(element));
      }
    }
    return result;
  }

  static Uri? _getUriFromMap(Map<String, dynamic> map, String key) {
    var uri = map.whereKey(key);
    if (uri != null) {
      if (uri is Uri) return uri;
      if (uri is String) return Uri.tryParse(uri);
    }
    return uri;
  }

  @override
  Map<String, dynamic> toMap() {
    final map = super.toMap();
    map.remove('imageLinks');
    map['coverImageLinks'] = coverImageLinks.map((e) => e.toMap()).toList();
    return map;
  }
}

class FirebaseIndustryIdentifier extends BaseIndustryIdentifier {
  const FirebaseIndustryIdentifier({super.type, super.identifier});

  factory FirebaseIndustryIdentifier.fromMap(Map<String, dynamic> map) {
    return FirebaseIndustryIdentifier(
      type: map.whereKey('type') ?? '',
      identifier: map.whereKey('identifier') ?? '',
    );
  }
}

class FirebaseCoverImageLink extends BaseCoverImageLink {
  factory FirebaseCoverImageLink.fromMap(Map<String, dynamic> map) {
    return FirebaseCoverImageLink(
      size: map.whereKey('size') is int
          ? BookCoverSize.values[map.whereKey('size') as int]
          : BookCoverSize.defaultThumbnail,
      url: map.whereKey('url'),
    );
  }
  const FirebaseCoverImageLink({required super.size, required super.url});
}
