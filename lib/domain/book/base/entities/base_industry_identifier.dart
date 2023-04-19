abstract class BaseIndustryIdentifier {
  final String type;
  final String identifier;

  const BaseIndustryIdentifier({
    this.type = '',
    this.identifier = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'identifier': identifier,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BaseIndustryIdentifier &&
        other.type == type &&
        other.identifier == identifier;
  }

  @override
  int get hashCode => type.hashCode ^ identifier.hashCode;

  @override
  String toString() => '$type:$identifier';
}
