// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cover_image_link.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const CoverImageLinkModelSchema = Schema(
  name: r'CoverImageLinkModel',
  id: 8240455036200812049,
  properties: {
    r'size': PropertySchema(
      id: 0,
      name: r'size',
      type: IsarType.byte,
      enumMap: _CoverImageLinkModelsizeEnumValueMap,
    ),
    r'url': PropertySchema(
      id: 1,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _coverImageLinkModelEstimateSize,
  serialize: _coverImageLinkModelSerialize,
  deserialize: _coverImageLinkModelDeserialize,
  deserializeProp: _coverImageLinkModelDeserializeProp,
);

int _coverImageLinkModelEstimateSize(
  CoverImageLinkModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.url;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _coverImageLinkModelSerialize(
  CoverImageLinkModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.size.index);
  writer.writeString(offsets[1], object.url);
}

CoverImageLinkModel _coverImageLinkModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CoverImageLinkModel(
    size: _CoverImageLinkModelsizeValueEnumMap[
            reader.readByteOrNull(offsets[0])] ??
        BookCoverSize.defaultThumbnail,
    url: reader.readStringOrNull(offsets[1]),
  );
  return object;
}

P _coverImageLinkModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_CoverImageLinkModelsizeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          BookCoverSize.defaultThumbnail) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CoverImageLinkModelsizeEnumValueMap = {
  'defaultThumbnail': 0,
  'smallThumbnail': 1,
  'mediumThumbnail': 2,
  'largeThumbnail': 3,
  'small': 4,
  'medium': 5,
  'extraLarge': 6,
  'large': 7,
};
const _CoverImageLinkModelsizeValueEnumMap = {
  0: BookCoverSize.defaultThumbnail,
  1: BookCoverSize.smallThumbnail,
  2: BookCoverSize.mediumThumbnail,
  3: BookCoverSize.largeThumbnail,
  4: BookCoverSize.small,
  5: BookCoverSize.medium,
  6: BookCoverSize.extraLarge,
  7: BookCoverSize.large,
};

extension CoverImageLinkModelQueryFilter on QueryBuilder<CoverImageLinkModel,
    CoverImageLinkModel, QFilterCondition> {
  QueryBuilder<CoverImageLinkModel, CoverImageLinkModel, QAfterFilterCondition>
      sizeEqualTo(BookCoverSize value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'size',
        value: value,
      ));
    });
  }

  QueryBuilder<CoverImageLinkModel, CoverImageLinkModel, QAfterFilterCondition>
      sizeGreaterThan(
    BookCoverSize value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'size',
        value: value,
      ));
    });
  }

  QueryBuilder<CoverImageLinkModel, CoverImageLinkModel, QAfterFilterCondition>
      sizeLessThan(
    BookCoverSize value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'size',
        value: value,
      ));
    });
  }

  QueryBuilder<CoverImageLinkModel, CoverImageLinkModel, QAfterFilterCondition>
      sizeBetween(
    BookCoverSize lower,
    BookCoverSize upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'size',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CoverImageLinkModel, CoverImageLinkModel, QAfterFilterCondition>
      urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<CoverImageLinkModel, CoverImageLinkModel, QAfterFilterCondition>
      urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<CoverImageLinkModel, CoverImageLinkModel, QAfterFilterCondition>
      urlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImageLinkModel, CoverImageLinkModel, QAfterFilterCondition>
      urlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImageLinkModel, CoverImageLinkModel, QAfterFilterCondition>
      urlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImageLinkModel, CoverImageLinkModel, QAfterFilterCondition>
      urlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImageLinkModel, CoverImageLinkModel, QAfterFilterCondition>
      urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImageLinkModel, CoverImageLinkModel, QAfterFilterCondition>
      urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImageLinkModel, CoverImageLinkModel, QAfterFilterCondition>
      urlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImageLinkModel, CoverImageLinkModel, QAfterFilterCondition>
      urlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CoverImageLinkModel, CoverImageLinkModel, QAfterFilterCondition>
      urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<CoverImageLinkModel, CoverImageLinkModel, QAfterFilterCondition>
      urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension CoverImageLinkModelQueryObject on QueryBuilder<CoverImageLinkModel,
    CoverImageLinkModel, QFilterCondition> {}
