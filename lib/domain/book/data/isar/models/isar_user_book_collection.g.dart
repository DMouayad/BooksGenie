// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_user_book_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarUserBookCollectionCollection on Isar {
  IsarCollection<IsarUserBookCollection> get isarUserBookCollections =>
      this.collection();
}

const IsarUserBookCollectionSchema = CollectionSchema(
  name: r'IsarUserBookCollection',
  id: -3436816135781793426,
  properties: {
    r'bookId': PropertySchema(
      id: 0,
      name: r'bookId',
      type: IsarType.string,
    ),
    r'collections': PropertySchema(
      id: 1,
      name: r'collections',
      type: IsarType.byteList,
      enumMap: _IsarUserBookCollectioncollectionsEnumValueMap,
    ),
    r'completionPercent': PropertySchema(
      id: 2,
      name: r'completionPercent',
      type: IsarType.double,
    ),
    r'hashCode': PropertySchema(
      id: 3,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'userId': PropertySchema(
      id: 4,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _isarUserBookCollectionEstimateSize,
  serialize: _isarUserBookCollectionSerialize,
  deserialize: _isarUserBookCollectionDeserialize,
  deserializeProp: _isarUserBookCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId_bookId': IndexSchema(
      id: 2173470386616237740,
      name: r'userId_bookId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'bookId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _isarUserBookCollectionGetId,
  getLinks: _isarUserBookCollectionGetLinks,
  attach: _isarUserBookCollectionAttach,
  version: '3.1.0+1',
);

int _isarUserBookCollectionEstimateSize(
  IsarUserBookCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.bookId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.collections.length;
  return bytesCount;
}

void _isarUserBookCollectionSerialize(
  IsarUserBookCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bookId);
  writer.writeByteList(
      offsets[1], object.collections.map((e) => e.index).toList());
  writer.writeDouble(offsets[2], object.completionPercent);
  writer.writeLong(offsets[3], object.hashCode);
  writer.writeLong(offsets[4], object.userId);
}

IsarUserBookCollection _isarUserBookCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarUserBookCollection(
    bookId: reader.readStringOrNull(offsets[0]),
    collections: reader
            .readByteList(offsets[1])
            ?.map((e) =>
                _IsarUserBookCollectioncollectionsValueEnumMap[e] ??
                BooksCollection.favorite)
            .toList() ??
        const [],
    completionPercent: reader.readDoubleOrNull(offsets[2]),
    id: id,
    userId: reader.readLongOrNull(offsets[4]),
  );
  return object;
}

P _isarUserBookCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader
              .readByteList(offset)
              ?.map((e) =>
                  _IsarUserBookCollectioncollectionsValueEnumMap[e] ??
                  BooksCollection.favorite)
              .toList() ??
          const []) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarUserBookCollectioncollectionsEnumValueMap = {
  'favorite': 0,
  'readingNow': 1,
  'completedReading': 2,
};
const _IsarUserBookCollectioncollectionsValueEnumMap = {
  0: BooksCollection.favorite,
  1: BooksCollection.readingNow,
  2: BooksCollection.completedReading,
};

Id _isarUserBookCollectionGetId(IsarUserBookCollection object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _isarUserBookCollectionGetLinks(
    IsarUserBookCollection object) {
  return [];
}

void _isarUserBookCollectionAttach(
    IsarCollection<dynamic> col, Id id, IsarUserBookCollection object) {
  object.id = id;
}

extension IsarUserBookCollectionByIndex
    on IsarCollection<IsarUserBookCollection> {
  Future<IsarUserBookCollection?> getByUserIdBookId(
      int? userId, String? bookId) {
    return getByIndex(r'userId_bookId', [userId, bookId]);
  }

  IsarUserBookCollection? getByUserIdBookIdSync(int? userId, String? bookId) {
    return getByIndexSync(r'userId_bookId', [userId, bookId]);
  }

  Future<bool> deleteByUserIdBookId(int? userId, String? bookId) {
    return deleteByIndex(r'userId_bookId', [userId, bookId]);
  }

  bool deleteByUserIdBookIdSync(int? userId, String? bookId) {
    return deleteByIndexSync(r'userId_bookId', [userId, bookId]);
  }

  Future<List<IsarUserBookCollection?>> getAllByUserIdBookId(
      List<int?> userIdValues, List<String?> bookIdValues) {
    final len = userIdValues.length;
    assert(bookIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([userIdValues[i], bookIdValues[i]]);
    }

    return getAllByIndex(r'userId_bookId', values);
  }

  List<IsarUserBookCollection?> getAllByUserIdBookIdSync(
      List<int?> userIdValues, List<String?> bookIdValues) {
    final len = userIdValues.length;
    assert(bookIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([userIdValues[i], bookIdValues[i]]);
    }

    return getAllByIndexSync(r'userId_bookId', values);
  }

  Future<int> deleteAllByUserIdBookId(
      List<int?> userIdValues, List<String?> bookIdValues) {
    final len = userIdValues.length;
    assert(bookIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([userIdValues[i], bookIdValues[i]]);
    }

    return deleteAllByIndex(r'userId_bookId', values);
  }

  int deleteAllByUserIdBookIdSync(
      List<int?> userIdValues, List<String?> bookIdValues) {
    final len = userIdValues.length;
    assert(bookIdValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([userIdValues[i], bookIdValues[i]]);
    }

    return deleteAllByIndexSync(r'userId_bookId', values);
  }

  Future<Id> putByUserIdBookId(IsarUserBookCollection object) {
    return putByIndex(r'userId_bookId', object);
  }

  Id putByUserIdBookIdSync(IsarUserBookCollection object,
      {bool saveLinks = true}) {
    return putByIndexSync(r'userId_bookId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUserIdBookId(List<IsarUserBookCollection> objects) {
    return putAllByIndex(r'userId_bookId', objects);
  }

  List<Id> putAllByUserIdBookIdSync(List<IsarUserBookCollection> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'userId_bookId', objects, saveLinks: saveLinks);
  }
}

extension IsarUserBookCollectionQueryWhereSort
    on QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QWhere> {
  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarUserBookCollectionQueryWhere on QueryBuilder<
    IsarUserBookCollection, IsarUserBookCollection, QWhereClause> {
  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterWhereClause> userIdIsNullAnyBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId_bookId',
        value: [null],
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterWhereClause> userIdIsNotNullAnyBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId_bookId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterWhereClause> userIdEqualToAnyBookId(int? userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId_bookId',
        value: [userId],
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterWhereClause> userIdNotEqualToAnyBookId(int? userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_bookId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_bookId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_bookId',
              lower: [userId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_bookId',
              lower: [],
              upper: [userId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterWhereClause> userIdGreaterThanAnyBookId(
    int? userId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId_bookId',
        lower: [userId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterWhereClause> userIdLessThanAnyBookId(
    int? userId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId_bookId',
        lower: [],
        upper: [userId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterWhereClause> userIdBetweenAnyBookId(
    int? lowerUserId,
    int? upperUserId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId_bookId',
        lower: [lowerUserId],
        includeLower: includeLower,
        upper: [upperUserId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterWhereClause> userIdEqualToBookIdIsNull(int? userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId_bookId',
        value: [userId, null],
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterWhereClause> userIdEqualToBookIdIsNotNull(int? userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'userId_bookId',
        lower: [userId, null],
        includeLower: false,
        upper: [
          userId,
        ],
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterWhereClause> userIdBookIdEqualTo(int? userId, String? bookId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'userId_bookId',
        value: [userId, bookId],
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
          QAfterWhereClause>
      userIdEqualToBookIdNotEqualTo(int? userId, String? bookId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_bookId',
              lower: [userId],
              upper: [userId, bookId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_bookId',
              lower: [userId, bookId],
              includeLower: false,
              upper: [userId],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_bookId',
              lower: [userId, bookId],
              includeLower: false,
              upper: [userId],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'userId_bookId',
              lower: [userId],
              upper: [userId, bookId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension IsarUserBookCollectionQueryFilter on QueryBuilder<
    IsarUserBookCollection, IsarUserBookCollection, QFilterCondition> {
  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> bookIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bookId',
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> bookIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bookId',
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> bookIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> bookIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bookId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> bookIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bookId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> bookIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bookId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> bookIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bookId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> bookIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bookId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
          QAfterFilterCondition>
      bookIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bookId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
          QAfterFilterCondition>
      bookIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bookId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> bookIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> bookIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bookId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> collectionsElementEqualTo(BooksCollection value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'collections',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> collectionsElementGreaterThan(
    BooksCollection value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'collections',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> collectionsElementLessThan(
    BooksCollection value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'collections',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> collectionsElementBetween(
    BooksCollection lower,
    BooksCollection upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'collections',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> collectionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'collections',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> collectionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'collections',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> collectionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'collections',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> collectionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'collections',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> collectionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'collections',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> collectionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'collections',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> completionPercentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'completionPercent',
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> completionPercentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'completionPercent',
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> completionPercentEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completionPercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> completionPercentGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'completionPercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> completionPercentLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'completionPercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> completionPercentBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'completionPercent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> hashCodeGreaterThan(
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

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> hashCodeLessThan(
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

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> hashCodeBetween(
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

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> userIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> userIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> userIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection,
      QAfterFilterCondition> userIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarUserBookCollectionQueryObject on QueryBuilder<
    IsarUserBookCollection, IsarUserBookCollection, QFilterCondition> {}

extension IsarUserBookCollectionQueryLinks on QueryBuilder<
    IsarUserBookCollection, IsarUserBookCollection, QFilterCondition> {}

extension IsarUserBookCollectionQuerySortBy
    on QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QSortBy> {
  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QAfterSortBy>
      sortByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.asc);
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QAfterSortBy>
      sortByBookIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.desc);
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QAfterSortBy>
      sortByCompletionPercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionPercent', Sort.asc);
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QAfterSortBy>
      sortByCompletionPercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionPercent', Sort.desc);
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QAfterSortBy>
      sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QAfterSortBy>
      sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QAfterSortBy>
      sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension IsarUserBookCollectionQuerySortThenBy on QueryBuilder<
    IsarUserBookCollection, IsarUserBookCollection, QSortThenBy> {
  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QAfterSortBy>
      thenByBookId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.asc);
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QAfterSortBy>
      thenByBookIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookId', Sort.desc);
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QAfterSortBy>
      thenByCompletionPercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionPercent', Sort.asc);
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QAfterSortBy>
      thenByCompletionPercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completionPercent', Sort.desc);
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QAfterSortBy>
      thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QAfterSortBy>
      thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QAfterSortBy>
      thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension IsarUserBookCollectionQueryWhereDistinct
    on QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QDistinct> {
  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QDistinct>
      distinctByBookId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QDistinct>
      distinctByCollections() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'collections');
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QDistinct>
      distinctByCompletionPercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completionPercent');
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QDistinct>
      distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<IsarUserBookCollection, IsarUserBookCollection, QDistinct>
      distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension IsarUserBookCollectionQueryProperty on QueryBuilder<
    IsarUserBookCollection, IsarUserBookCollection, QQueryProperty> {
  QueryBuilder<IsarUserBookCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarUserBookCollection, String?, QQueryOperations>
      bookIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookId');
    });
  }

  QueryBuilder<IsarUserBookCollection, List<BooksCollection>, QQueryOperations>
      collectionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'collections');
    });
  }

  QueryBuilder<IsarUserBookCollection, double?, QQueryOperations>
      completionPercentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completionPercent');
    });
  }

  QueryBuilder<IsarUserBookCollection, int, QQueryOperations>
      hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<IsarUserBookCollection, int?, QQueryOperations>
      userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
