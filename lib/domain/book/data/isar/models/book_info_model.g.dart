// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_info_model.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const BookInfoModelSchema = Schema(
  name: r'BookInfoModel',
  id: -6812993202182824161,
  properties: {
    r'authors': PropertySchema(
      id: 0,
      name: r'authors',
      type: IsarType.stringList,
    ),
    r'averageRating': PropertySchema(
      id: 1,
      name: r'averageRating',
      type: IsarType.double,
    ),
    r'canonicalVolumeLinkString': PropertySchema(
      id: 2,
      name: r'canonicalVolumeLinkString',
      type: IsarType.string,
    ),
    r'categories': PropertySchema(
      id: 3,
      name: r'categories',
      type: IsarType.stringList,
    ),
    r'contentVersion': PropertySchema(
      id: 4,
      name: r'contentVersion',
      type: IsarType.string,
    ),
    r'coverImageLinks': PropertySchema(
      id: 5,
      name: r'coverImageLinks',
      type: IsarType.objectList,
      target: r'CoverImageLinkModel',
    ),
    r'description': PropertySchema(
      id: 6,
      name: r'description',
      type: IsarType.string,
    ),
    r'hashCode': PropertySchema(
      id: 7,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'industryIdentifiers': PropertySchema(
      id: 8,
      name: r'industryIdentifiers',
      type: IsarType.objectList,
      target: r'IndustryIdentifierModel',
    ),
    r'infoLinkString': PropertySchema(
      id: 9,
      name: r'infoLinkString',
      type: IsarType.string,
    ),
    r'language': PropertySchema(
      id: 10,
      name: r'language',
      type: IsarType.string,
    ),
    r'maturityRating': PropertySchema(
      id: 11,
      name: r'maturityRating',
      type: IsarType.string,
    ),
    r'pageCount': PropertySchema(
      id: 12,
      name: r'pageCount',
      type: IsarType.long,
    ),
    r'previewLinkString': PropertySchema(
      id: 13,
      name: r'previewLinkString',
      type: IsarType.string,
    ),
    r'publishedDate': PropertySchema(
      id: 14,
      name: r'publishedDate',
      type: IsarType.dateTime,
    ),
    r'publisher': PropertySchema(
      id: 15,
      name: r'publisher',
      type: IsarType.string,
    ),
    r'ratingsCount': PropertySchema(
      id: 16,
      name: r'ratingsCount',
      type: IsarType.long,
    ),
    r'rawPublishedDate': PropertySchema(
      id: 17,
      name: r'rawPublishedDate',
      type: IsarType.string,
    ),
    r'reviewsLinkString': PropertySchema(
      id: 18,
      name: r'reviewsLinkString',
      type: IsarType.string,
    ),
    r'smallThumbnailImageLink': PropertySchema(
      id: 19,
      name: r'smallThumbnailImageLink',
      type: IsarType.string,
    ),
    r'stringify': PropertySchema(
      id: 20,
      name: r'stringify',
      type: IsarType.bool,
    ),
    r'subtitle': PropertySchema(
      id: 21,
      name: r'subtitle',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 22,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _bookInfoModelEstimateSize,
  serialize: _bookInfoModelSerialize,
  deserialize: _bookInfoModelDeserialize,
  deserializeProp: _bookInfoModelDeserializeProp,
);

int _bookInfoModelEstimateSize(
  BookInfoModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.authors.length * 3;
  {
    for (var i = 0; i < object.authors.length; i++) {
      final value = object.authors[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.canonicalVolumeLinkString.length * 3;
  bytesCount += 3 + object.categories.length * 3;
  {
    for (var i = 0; i < object.categories.length; i++) {
      final value = object.categories[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.contentVersion.length * 3;
  bytesCount += 3 + object.coverImageLinks.length * 3;
  {
    final offsets = allOffsets[CoverImageLinkModel]!;
    for (var i = 0; i < object.coverImageLinks.length; i++) {
      final value = object.coverImageLinks[i];
      bytesCount +=
          CoverImageLinkModelSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.industryIdentifiers.length * 3;
  {
    final offsets = allOffsets[IndustryIdentifierModel]!;
    for (var i = 0; i < object.industryIdentifiers.length; i++) {
      final value = object.industryIdentifiers[i];
      bytesCount += IndustryIdentifierModelSchema.estimateSize(
          value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.infoLinkString.length * 3;
  bytesCount += 3 + object.language.length * 3;
  bytesCount += 3 + object.maturityRating.length * 3;
  bytesCount += 3 + object.previewLinkString.length * 3;
  bytesCount += 3 + object.publisher.length * 3;
  bytesCount += 3 + object.rawPublishedDate.length * 3;
  bytesCount += 3 + object.reviewsLinkString.length * 3;
  {
    final value = object.smallThumbnailImageLink;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.subtitle.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _bookInfoModelSerialize(
  BookInfoModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.authors);
  writer.writeDouble(offsets[1], object.averageRating);
  writer.writeString(offsets[2], object.canonicalVolumeLinkString);
  writer.writeStringList(offsets[3], object.categories);
  writer.writeString(offsets[4], object.contentVersion);
  writer.writeObjectList<CoverImageLinkModel>(
    offsets[5],
    allOffsets,
    CoverImageLinkModelSchema.serialize,
    object.coverImageLinks,
  );
  writer.writeString(offsets[6], object.description);
  writer.writeLong(offsets[7], object.hashCode);
  writer.writeObjectList<IndustryIdentifierModel>(
    offsets[8],
    allOffsets,
    IndustryIdentifierModelSchema.serialize,
    object.industryIdentifiers,
  );
  writer.writeString(offsets[9], object.infoLinkString);
  writer.writeString(offsets[10], object.language);
  writer.writeString(offsets[11], object.maturityRating);
  writer.writeLong(offsets[12], object.pageCount);
  writer.writeString(offsets[13], object.previewLinkString);
  writer.writeDateTime(offsets[14], object.publishedDate);
  writer.writeString(offsets[15], object.publisher);
  writer.writeLong(offsets[16], object.ratingsCount);
  writer.writeString(offsets[17], object.rawPublishedDate);
  writer.writeString(offsets[18], object.reviewsLinkString);
  writer.writeString(offsets[19], object.smallThumbnailImageLink);
  writer.writeBool(offsets[20], object.stringify);
  writer.writeString(offsets[21], object.subtitle);
  writer.writeString(offsets[22], object.title);
}

BookInfoModel _bookInfoModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BookInfoModel(
    authors: reader.readStringList(offsets[0]) ?? const [],
    averageRating: reader.readDoubleOrNull(offsets[1]) ?? 0.0,
    canonicalVolumeLinkString: reader.readStringOrNull(offsets[2]) ?? '',
    categories: reader.readStringList(offsets[3]) ?? const [],
    contentVersion: reader.readStringOrNull(offsets[4]) ?? "",
    coverImageLinks: reader.readObjectList<CoverImageLinkModel>(
          offsets[5],
          CoverImageLinkModelSchema.deserialize,
          allOffsets,
          CoverImageLinkModel(),
        ) ??
        const [],
    description: reader.readStringOrNull(offsets[6]) ?? "",
    industryIdentifiers: reader.readObjectList<IndustryIdentifierModel>(
          offsets[8],
          IndustryIdentifierModelSchema.deserialize,
          allOffsets,
          IndustryIdentifierModel(),
        ) ??
        const [],
    infoLinkString: reader.readStringOrNull(offsets[9]) ?? "",
    language: reader.readStringOrNull(offsets[10]) ?? "",
    maturityRating: reader.readStringOrNull(offsets[11]) ?? "",
    pageCount: reader.readLongOrNull(offsets[12]) ?? 0,
    previewLinkString: reader.readStringOrNull(offsets[13]) ?? "",
    publishedDate: reader.readDateTimeOrNull(offsets[14]),
    publisher: reader.readStringOrNull(offsets[15]) ?? "",
    ratingsCount: reader.readLongOrNull(offsets[16]) ?? 0,
    rawPublishedDate: reader.readStringOrNull(offsets[17]) ?? "",
    reviewsLinkString: reader.readStringOrNull(offsets[18]) ?? "",
    subtitle: reader.readStringOrNull(offsets[21]) ?? "",
    title: reader.readStringOrNull(offsets[22]) ?? "",
  );
  return object;
}

P _bookInfoModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? const []) as P;
    case 1:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 2:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 3:
      return (reader.readStringList(offset) ?? const []) as P;
    case 4:
      return (reader.readStringOrNull(offset) ?? "") as P;
    case 5:
      return (reader.readObjectList<CoverImageLinkModel>(
            offset,
            CoverImageLinkModelSchema.deserialize,
            allOffsets,
            CoverImageLinkModel(),
          ) ??
          const []) as P;
    case 6:
      return (reader.readStringOrNull(offset) ?? "") as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readObjectList<IndustryIdentifierModel>(
            offset,
            IndustryIdentifierModelSchema.deserialize,
            allOffsets,
            IndustryIdentifierModel(),
          ) ??
          const []) as P;
    case 9:
      return (reader.readStringOrNull(offset) ?? "") as P;
    case 10:
      return (reader.readStringOrNull(offset) ?? "") as P;
    case 11:
      return (reader.readStringOrNull(offset) ?? "") as P;
    case 12:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 13:
      return (reader.readStringOrNull(offset) ?? "") as P;
    case 14:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset) ?? "") as P;
    case 16:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 17:
      return (reader.readStringOrNull(offset) ?? "") as P;
    case 18:
      return (reader.readStringOrNull(offset) ?? "") as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readBoolOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset) ?? "") as P;
    case 22:
      return (reader.readStringOrNull(offset) ?? "") as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension BookInfoModelQueryFilter
    on QueryBuilder<BookInfoModel, BookInfoModel, QFilterCondition> {
  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      authorsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      authorsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'authors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      authorsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'authors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      authorsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'authors',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      authorsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'authors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      authorsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'authors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      authorsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      authorsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authors',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      authorsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authors',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      authorsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authors',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      authorsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authors',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      authorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authors',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      authorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authors',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      authorsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authors',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      authorsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authors',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      authorsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authors',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      averageRatingEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averageRating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      averageRatingGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'averageRating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      averageRatingLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'averageRating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      averageRatingBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'averageRating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      canonicalVolumeLinkStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canonicalVolumeLinkString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      canonicalVolumeLinkStringGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'canonicalVolumeLinkString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      canonicalVolumeLinkStringLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'canonicalVolumeLinkString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      canonicalVolumeLinkStringBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'canonicalVolumeLinkString',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      canonicalVolumeLinkStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'canonicalVolumeLinkString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      canonicalVolumeLinkStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'canonicalVolumeLinkString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      canonicalVolumeLinkStringContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'canonicalVolumeLinkString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      canonicalVolumeLinkStringMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'canonicalVolumeLinkString',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      canonicalVolumeLinkStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canonicalVolumeLinkString',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      canonicalVolumeLinkStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'canonicalVolumeLinkString',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      categoriesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      categoriesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      categoriesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      categoriesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      categoriesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      categoriesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      categoriesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      categoriesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categories',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      categoriesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categories',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      categoriesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categories',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      categoriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      categoriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      categoriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      categoriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      categoriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      categoriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      contentVersionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contentVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      contentVersionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contentVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      contentVersionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contentVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      contentVersionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contentVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      contentVersionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contentVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      contentVersionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contentVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      contentVersionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contentVersion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      contentVersionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contentVersion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      contentVersionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contentVersion',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      contentVersionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contentVersion',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      coverImageLinksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coverImageLinks',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      coverImageLinksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coverImageLinks',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      coverImageLinksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coverImageLinks',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      coverImageLinksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coverImageLinks',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      coverImageLinksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coverImageLinks',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      coverImageLinksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coverImageLinks',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      industryIdentifiersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'industryIdentifiers',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      industryIdentifiersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'industryIdentifiers',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      industryIdentifiersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'industryIdentifiers',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      industryIdentifiersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'industryIdentifiers',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      industryIdentifiersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'industryIdentifiers',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      industryIdentifiersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'industryIdentifiers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      infoLinkStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'infoLinkString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      infoLinkStringGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'infoLinkString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      infoLinkStringLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'infoLinkString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      infoLinkStringBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'infoLinkString',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      infoLinkStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'infoLinkString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      infoLinkStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'infoLinkString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      infoLinkStringContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'infoLinkString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      infoLinkStringMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'infoLinkString',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      infoLinkStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'infoLinkString',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      infoLinkStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'infoLinkString',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      languageEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      languageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      languageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      languageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'language',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      languageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      languageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      languageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'language',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      languageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'language',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      languageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      languageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'language',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      maturityRatingEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maturityRating',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      maturityRatingGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maturityRating',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      maturityRatingLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maturityRating',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      maturityRatingBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maturityRating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      maturityRatingStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'maturityRating',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      maturityRatingEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'maturityRating',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      maturityRatingContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'maturityRating',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      maturityRatingMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'maturityRating',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      maturityRatingIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maturityRating',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      maturityRatingIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'maturityRating',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      pageCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pageCount',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      pageCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pageCount',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      pageCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pageCount',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      pageCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pageCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      previewLinkStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'previewLinkString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      previewLinkStringGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'previewLinkString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      previewLinkStringLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'previewLinkString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      previewLinkStringBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'previewLinkString',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      previewLinkStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'previewLinkString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      previewLinkStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'previewLinkString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      previewLinkStringContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'previewLinkString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      previewLinkStringMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'previewLinkString',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      previewLinkStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'previewLinkString',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      previewLinkStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'previewLinkString',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      publishedDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'publishedDate',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      publishedDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'publishedDate',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      publishedDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publishedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      publishedDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'publishedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      publishedDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'publishedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      publishedDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'publishedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      publisherEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publisher',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      publisherGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'publisher',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      publisherLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'publisher',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      publisherBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'publisher',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      publisherStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'publisher',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      publisherEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'publisher',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      publisherContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'publisher',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      publisherMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'publisher',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      publisherIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publisher',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      publisherIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'publisher',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      ratingsCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ratingsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      ratingsCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ratingsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      ratingsCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ratingsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      ratingsCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ratingsCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      rawPublishedDateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rawPublishedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      rawPublishedDateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rawPublishedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      rawPublishedDateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rawPublishedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      rawPublishedDateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rawPublishedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      rawPublishedDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rawPublishedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      rawPublishedDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rawPublishedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      rawPublishedDateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rawPublishedDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      rawPublishedDateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rawPublishedDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      rawPublishedDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rawPublishedDate',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      rawPublishedDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rawPublishedDate',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      reviewsLinkStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reviewsLinkString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      reviewsLinkStringGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reviewsLinkString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      reviewsLinkStringLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reviewsLinkString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      reviewsLinkStringBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reviewsLinkString',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      reviewsLinkStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reviewsLinkString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      reviewsLinkStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reviewsLinkString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      reviewsLinkStringContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reviewsLinkString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      reviewsLinkStringMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reviewsLinkString',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      reviewsLinkStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reviewsLinkString',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      reviewsLinkStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reviewsLinkString',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      smallThumbnailImageLinkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'smallThumbnailImageLink',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      smallThumbnailImageLinkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'smallThumbnailImageLink',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      smallThumbnailImageLinkEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'smallThumbnailImageLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      smallThumbnailImageLinkGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'smallThumbnailImageLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      smallThumbnailImageLinkLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'smallThumbnailImageLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      smallThumbnailImageLinkBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'smallThumbnailImageLink',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      smallThumbnailImageLinkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'smallThumbnailImageLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      smallThumbnailImageLinkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'smallThumbnailImageLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      smallThumbnailImageLinkContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'smallThumbnailImageLink',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      smallThumbnailImageLinkMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'smallThumbnailImageLink',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      smallThumbnailImageLinkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'smallThumbnailImageLink',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      smallThumbnailImageLinkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'smallThumbnailImageLink',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      stringifyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stringify',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      stringifyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stringify',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      stringifyEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stringify',
        value: value,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      subtitleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      subtitleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subtitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      subtitleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subtitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      subtitleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subtitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      subtitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subtitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      subtitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subtitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      subtitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subtitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      subtitleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subtitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      subtitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtitle',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      subtitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subtitle',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension BookInfoModelQueryObject
    on QueryBuilder<BookInfoModel, BookInfoModel, QFilterCondition> {
  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      coverImageLinksElement(FilterQuery<CoverImageLinkModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'coverImageLinks');
    });
  }

  QueryBuilder<BookInfoModel, BookInfoModel, QAfterFilterCondition>
      industryIdentifiersElement(FilterQuery<IndustryIdentifierModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'industryIdentifiers');
    });
  }
}
