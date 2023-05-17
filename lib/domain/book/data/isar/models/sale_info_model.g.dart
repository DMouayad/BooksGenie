// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_info_model.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SaleInfoModelSchema = Schema(
  name: r'SaleInfoModel',
  id: 6221129038358779729,
  properties: {
    r'country': PropertySchema(
      id: 0,
      name: r'country',
      type: IsarType.string,
    ),
    r'hashCode': PropertySchema(
      id: 1,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'isEbook': PropertySchema(
      id: 2,
      name: r'isEbook',
      type: IsarType.bool,
    ),
    r'saleability': PropertySchema(
      id: 3,
      name: r'saleability',
      type: IsarType.string,
    )
  },
  estimateSize: _saleInfoModelEstimateSize,
  serialize: _saleInfoModelSerialize,
  deserialize: _saleInfoModelDeserialize,
  deserializeProp: _saleInfoModelDeserializeProp,
);

int _saleInfoModelEstimateSize(
  SaleInfoModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.country.length * 3;
  bytesCount += 3 + object.saleability.length * 3;
  return bytesCount;
}

void _saleInfoModelSerialize(
  SaleInfoModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.country);
  writer.writeLong(offsets[1], object.hashCode);
  writer.writeBool(offsets[2], object.isEbook);
  writer.writeString(offsets[3], object.saleability);
}

SaleInfoModel _saleInfoModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SaleInfoModel(
    country: reader.readStringOrNull(offsets[0]) ?? "",
    isEbook: reader.readBoolOrNull(offsets[2]) ?? false,
    saleability: reader.readStringOrNull(offsets[3]) ?? "",
  );
  return object;
}

P _saleInfoModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset) ?? "") as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 3:
      return (reader.readStringOrNull(offset) ?? "") as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SaleInfoModelQueryFilter
    on QueryBuilder<SaleInfoModel, SaleInfoModel, QFilterCondition> {
  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
      countryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
      countryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
      countryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
      countryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'country',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
      countryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
      countryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
      countryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
      countryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'country',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
      countryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'country',
        value: '',
      ));
    });
  }

  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
      countryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'country',
        value: '',
      ));
    });
  }

  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
      hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
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

  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
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

  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
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

  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
      isEbookEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isEbook',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
      saleabilityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saleability',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
      saleabilityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'saleability',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
      saleabilityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'saleability',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
      saleabilityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'saleability',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
      saleabilityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'saleability',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
      saleabilityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'saleability',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
      saleabilityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'saleability',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
      saleabilityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'saleability',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
      saleabilityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'saleability',
        value: '',
      ));
    });
  }

  QueryBuilder<SaleInfoModel, SaleInfoModel, QAfterFilterCondition>
      saleabilityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'saleability',
        value: '',
      ));
    });
  }
}

extension SaleInfoModelQueryObject
    on QueryBuilder<SaleInfoModel, SaleInfoModel, QFilterCondition> {}
