// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetBookModelCollection on Isar {
  IsarCollection<BookModel> get bookModels => this.collection();
}

const BookModelSchema = CollectionSchema(
  name: r'BookModel',
  id: -8798672064070329451,
  properties: {
    r'etag': PropertySchema(
      id: 0,
      name: r'etag',
      type: IsarType.string,
    ),
    r'googleBookId': PropertySchema(
      id: 1,
      name: r'googleBookId',
      type: IsarType.string,
    ),
    r'hashCode': PropertySchema(
      id: 2,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'info': PropertySchema(
      id: 3,
      name: r'info',
      type: IsarType.object,
      target: r'BookInfoModel',
    ),
    r'saleInfo': PropertySchema(
      id: 4,
      name: r'saleInfo',
      type: IsarType.object,
      target: r'SaleInfoModel',
    )
  },
  estimateSize: _bookModelEstimateSize,
  serialize: _bookModelSerialize,
  deserialize: _bookModelDeserialize,
  deserializeProp: _bookModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'googleBookId': IndexSchema(
      id: 7472696255973718156,
      name: r'googleBookId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'googleBookId',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {
    r'BookInfoModel': BookInfoModelSchema,
    r'CoverImageLinkModel': CoverImageLinkModelSchema,
    r'IndustryIdentifierModel': IndustryIdentifierModelSchema,
    r'SaleInfoModel': SaleInfoModelSchema
  },
  getId: _bookModelGetId,
  getLinks: _bookModelGetLinks,
  attach: _bookModelAttach,
  version: '3.0.5',
);

int _bookModelEstimateSize(
  BookModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.etag;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.googleBookId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 +
      BookInfoModelSchema.estimateSize(
          object.info, allOffsets[BookInfoModel]!, allOffsets);
  bytesCount += 3 +
      SaleInfoModelSchema.estimateSize(
          object.saleInfo, allOffsets[SaleInfoModel]!, allOffsets);
  return bytesCount;
}

void _bookModelSerialize(
  BookModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.etag);
  writer.writeString(offsets[1], object.googleBookId);
  writer.writeLong(offsets[2], object.hashCode);
  writer.writeObject<BookInfoModel>(
    offsets[3],
    allOffsets,
    BookInfoModelSchema.serialize,
    object.info,
  );
  writer.writeObject<SaleInfoModel>(
    offsets[4],
    allOffsets,
    SaleInfoModelSchema.serialize,
    object.saleInfo,
  );
}

BookModel _bookModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BookModel(
    etag: reader.readStringOrNull(offsets[0]),
    googleBookId: reader.readStringOrNull(offsets[1]),
    info: reader.readObjectOrNull<BookInfoModel>(
          offsets[3],
          BookInfoModelSchema.deserialize,
          allOffsets,
        ) ??
        BookInfoModel(),
    saleInfo: reader.readObjectOrNull<SaleInfoModel>(
          offsets[4],
          SaleInfoModelSchema.deserialize,
          allOffsets,
        ) ??
        SaleInfoModel(),
  );
  object.isarId = id;
  return object;
}

P _bookModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<BookInfoModel>(
            offset,
            BookInfoModelSchema.deserialize,
            allOffsets,
          ) ??
          BookInfoModel()) as P;
    case 4:
      return (reader.readObjectOrNull<SaleInfoModel>(
            offset,
            SaleInfoModelSchema.deserialize,
            allOffsets,
          ) ??
          SaleInfoModel()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bookModelGetId(BookModel object) {
  return object.isarId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _bookModelGetLinks(BookModel object) {
  return [];
}

void _bookModelAttach(IsarCollection<dynamic> col, Id id, BookModel object) {
  object.isarId = id;
}

extension BookModelQueryWhereSort
    on QueryBuilder<BookModel, BookModel, QWhere> {
  QueryBuilder<BookModel, BookModel, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterWhere> anyGoogleBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'googleBookId'),
      );
    });
  }
}

extension BookModelQueryWhere
    on QueryBuilder<BookModel, BookModel, QWhereClause> {
  QueryBuilder<BookModel, BookModel, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterWhereClause> googleBookIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'googleBookId',
        value: [null],
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterWhereClause>
      googleBookIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'googleBookId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterWhereClause> googleBookIdEqualTo(
      String? googleBookId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'googleBookId',
        value: [googleBookId],
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterWhereClause> googleBookIdNotEqualTo(
      String? googleBookId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'googleBookId',
              lower: [],
              upper: [googleBookId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'googleBookId',
              lower: [googleBookId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'googleBookId',
              lower: [googleBookId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'googleBookId',
              lower: [],
              upper: [googleBookId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterWhereClause> googleBookIdGreaterThan(
    String? googleBookId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'googleBookId',
        lower: [googleBookId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterWhereClause> googleBookIdLessThan(
    String? googleBookId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'googleBookId',
        lower: [],
        upper: [googleBookId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterWhereClause> googleBookIdBetween(
    String? lowerGoogleBookId,
    String? upperGoogleBookId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'googleBookId',
        lower: [lowerGoogleBookId],
        includeLower: includeLower,
        upper: [upperGoogleBookId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterWhereClause> googleBookIdStartsWith(
      String GoogleBookIdPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'googleBookId',
        lower: [GoogleBookIdPrefix],
        upper: ['$GoogleBookIdPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterWhereClause> googleBookIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'googleBookId',
        value: [''],
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterWhereClause>
      googleBookIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'googleBookId',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'googleBookId',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'googleBookId',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'googleBookId',
              upper: [''],
            ));
      }
    });
  }
}

extension BookModelQueryFilter
    on QueryBuilder<BookModel, BookModel, QFilterCondition> {
  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> etagIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'etag',
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> etagIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'etag',
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> etagEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'etag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> etagGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'etag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> etagLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'etag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> etagBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'etag',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> etagStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'etag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> etagEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'etag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> etagContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'etag',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> etagMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'etag',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> etagIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'etag',
        value: '',
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> etagIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'etag',
        value: '',
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      googleBookIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'googleBookId',
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      googleBookIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'googleBookId',
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> googleBookIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'googleBookId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      googleBookIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'googleBookId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      googleBookIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'googleBookId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> googleBookIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'googleBookId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      googleBookIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'googleBookId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      googleBookIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'googleBookId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      googleBookIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'googleBookId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> googleBookIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'googleBookId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      googleBookIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'googleBookId',
        value: '',
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition>
      googleBookIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'googleBookId',
        value: '',
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> hashCodeGreaterThan(
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

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> hashCodeLessThan(
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

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> hashCodeBetween(
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

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> isarIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> isarIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> isarIdEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> isarIdGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> isarIdLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> isarIdBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BookModelQueryObject
    on QueryBuilder<BookModel, BookModel, QFilterCondition> {
  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> info(
      FilterQuery<BookInfoModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'info');
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterFilterCondition> saleInfo(
      FilterQuery<SaleInfoModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'saleInfo');
    });
  }
}

extension BookModelQueryLinks
    on QueryBuilder<BookModel, BookModel, QFilterCondition> {}

extension BookModelQuerySortBy on QueryBuilder<BookModel, BookModel, QSortBy> {
  QueryBuilder<BookModel, BookModel, QAfterSortBy> sortByEtag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etag', Sort.asc);
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterSortBy> sortByEtagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etag', Sort.desc);
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterSortBy> sortByGoogleBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'googleBookId', Sort.asc);
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterSortBy> sortByGoogleBookIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'googleBookId', Sort.desc);
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterSortBy> sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }
}

extension BookModelQuerySortThenBy
    on QueryBuilder<BookModel, BookModel, QSortThenBy> {
  QueryBuilder<BookModel, BookModel, QAfterSortBy> thenByEtag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etag', Sort.asc);
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterSortBy> thenByEtagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'etag', Sort.desc);
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterSortBy> thenByGoogleBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'googleBookId', Sort.asc);
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterSortBy> thenByGoogleBookIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'googleBookId', Sort.desc);
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterSortBy> thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BookModel, BookModel, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension BookModelQueryWhereDistinct
    on QueryBuilder<BookModel, BookModel, QDistinct> {
  QueryBuilder<BookModel, BookModel, QDistinct> distinctByEtag(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'etag', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookModel, BookModel, QDistinct> distinctByGoogleBookId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'googleBookId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookModel, BookModel, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }
}

extension BookModelQueryProperty
    on QueryBuilder<BookModel, BookModel, QQueryProperty> {
  QueryBuilder<BookModel, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BookModel, String?, QQueryOperations> etagProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'etag');
    });
  }

  QueryBuilder<BookModel, String?, QQueryOperations> googleBookIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'googleBookId');
    });
  }

  QueryBuilder<BookModel, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<BookModel, BookInfoModel, QQueryOperations> infoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'info');
    });
  }

  QueryBuilder<BookModel, SaleInfoModel, QQueryOperations> saleInfoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saleInfo');
    });
  }
}
