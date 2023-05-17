// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'industry_identifier_model.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IndustryIdentifierModelSchema = Schema(
  name: r'IndustryIdentifierModel',
  id: 6438632695534129347,
  properties: {
    r'hashCode': PropertySchema(
      id: 0,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'identifier': PropertySchema(
      id: 1,
      name: r'identifier',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 2,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _industryIdentifierModelEstimateSize,
  serialize: _industryIdentifierModelSerialize,
  deserialize: _industryIdentifierModelDeserialize,
  deserializeProp: _industryIdentifierModelDeserializeProp,
);

int _industryIdentifierModelEstimateSize(
  IndustryIdentifierModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.identifier.length * 3;
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _industryIdentifierModelSerialize(
  IndustryIdentifierModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.hashCode);
  writer.writeString(offsets[1], object.identifier);
  writer.writeString(offsets[2], object.type);
}

IndustryIdentifierModel _industryIdentifierModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IndustryIdentifierModel(
    identifier: reader.readStringOrNull(offsets[1]) ?? '',
    type: reader.readStringOrNull(offsets[2]) ?? '',
  );
  return object;
}

P _industryIdentifierModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 2:
      return (reader.readStringOrNull(offset) ?? '') as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IndustryIdentifierModelQueryFilter on QueryBuilder<
    IndustryIdentifierModel, IndustryIdentifierModel, QFilterCondition> {
  QueryBuilder<IndustryIdentifierModel, IndustryIdentifierModel,
      QAfterFilterCondition> hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<IndustryIdentifierModel, IndustryIdentifierModel,
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

  QueryBuilder<IndustryIdentifierModel, IndustryIdentifierModel,
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

  QueryBuilder<IndustryIdentifierModel, IndustryIdentifierModel,
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

  QueryBuilder<IndustryIdentifierModel, IndustryIdentifierModel,
      QAfterFilterCondition> identifierEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'identifier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndustryIdentifierModel, IndustryIdentifierModel,
      QAfterFilterCondition> identifierGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'identifier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndustryIdentifierModel, IndustryIdentifierModel,
      QAfterFilterCondition> identifierLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'identifier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndustryIdentifierModel, IndustryIdentifierModel,
      QAfterFilterCondition> identifierBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'identifier',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndustryIdentifierModel, IndustryIdentifierModel,
      QAfterFilterCondition> identifierStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'identifier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndustryIdentifierModel, IndustryIdentifierModel,
      QAfterFilterCondition> identifierEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'identifier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndustryIdentifierModel, IndustryIdentifierModel,
          QAfterFilterCondition>
      identifierContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'identifier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndustryIdentifierModel, IndustryIdentifierModel,
          QAfterFilterCondition>
      identifierMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'identifier',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndustryIdentifierModel, IndustryIdentifierModel,
      QAfterFilterCondition> identifierIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'identifier',
        value: '',
      ));
    });
  }

  QueryBuilder<IndustryIdentifierModel, IndustryIdentifierModel,
      QAfterFilterCondition> identifierIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'identifier',
        value: '',
      ));
    });
  }

  QueryBuilder<IndustryIdentifierModel, IndustryIdentifierModel,
      QAfterFilterCondition> typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndustryIdentifierModel, IndustryIdentifierModel,
      QAfterFilterCondition> typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndustryIdentifierModel, IndustryIdentifierModel,
      QAfterFilterCondition> typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndustryIdentifierModel, IndustryIdentifierModel,
      QAfterFilterCondition> typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndustryIdentifierModel, IndustryIdentifierModel,
      QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndustryIdentifierModel, IndustryIdentifierModel,
      QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndustryIdentifierModel, IndustryIdentifierModel,
          QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndustryIdentifierModel, IndustryIdentifierModel,
          QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IndustryIdentifierModel, IndustryIdentifierModel,
      QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<IndustryIdentifierModel, IndustryIdentifierModel,
      QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension IndustryIdentifierModelQueryObject on QueryBuilder<
    IndustryIdentifierModel, IndustryIdentifierModel, QFilterCondition> {}
