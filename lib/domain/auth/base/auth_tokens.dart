import 'dart:convert';

class AuthTokens {
  final String refreshToken;
  final PersonalAccessToken accessToken;

  const AuthTokens({
    required this.refreshToken,
    required this.accessToken,
  });

  factory AuthTokens.fromJson(String json) =>
      AuthTokens.fromMap(jsonDecode(json));

  factory AuthTokens.fromMap(Map<String, dynamic> map) {
    assert(map.containsKey('refresh_token'));

    final accessTokenMap = map['access_token'];
    assert(accessTokenMap is Map<String, dynamic>);

    return AuthTokens(
      refreshToken: map['refresh_token'] as String,
      accessToken: PersonalAccessToken.fromMap(accessTokenMap),
    );
  }
}

class PersonalAccessToken {
  final String token;
  final DateTime? expiresAt;

  const PersonalAccessToken({
    required this.token,
    this.expiresAt,
  });

  factory PersonalAccessToken.fromJson(String json) =>
      PersonalAccessToken.fromMap(jsonDecode(json));

  factory PersonalAccessToken.fromMap(Map<String, dynamic> map) {
    return PersonalAccessToken(
      token: map['token'],
      expiresAt: DateTime.tryParse(map['expires_at']),
    );
  }

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'expires_at': expiresAt?.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'expires at: ${expiresAt.toString()}';
  }

  bool get isExpired {
    if (expiresAt == null) return false;
    return expiresAt!.isBefore(DateTime.now().toUtc()) ||
        expiresAt!.isAtSameMomentAs(DateTime.now().toUtc());
  }
}
