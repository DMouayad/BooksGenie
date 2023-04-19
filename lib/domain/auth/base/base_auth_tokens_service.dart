import 'package:books_genie/support/result/result.dart';

import 'auth_tokens.dart';

/// Manages saving and retrieving auth tokens
/// alongside refreshing the access token if needed.
///
abstract class BaseAuthTokensService {
  BaseAuthTokensService();

  /// The key to be used in access token read/write/delete
  String get accessTokenKey => 'accessToken';

  /// The key to be used in refresh token read/write/delete
  String get refreshTokenKey => 'refreshToken';

  /// returns the access token associated with [accessTokenKey]
  Future<PersonalAccessToken?> getAccessToken();

  /// returns the refresh token associated with [refreshTokenKey]
  Future<String?> getRefreshToken();

  /// Save access token value
  Future<bool> saveAccessToken(PersonalAccessToken token) async {
    return (await getAccessToken()) == token;
  }

  /// Save refresh token value
  Future<bool> saveRefreshToken(String value) async {
    return (await getRefreshToken()) == value;
  }

  Future<bool> deleteAccessToken() async {
    return (await getAccessToken()) == null;
  }

  Future<bool> deleteRefreshToken() async {
    return (await getRefreshToken()) == null;
  }

  Future<void> saveAuthTokens(AuthTokens authTokens) async {
    await saveRefreshToken(authTokens.refreshToken);
    await saveAccessToken(authTokens.accessToken);
  }

  Future<Result<String, AppError>> getValidAccessToken() async {
    final accessToken = await getAccessToken();
    if (accessToken != null) {
      // return the access token if was not expired
      if (!accessToken.isExpired) {
        return SuccessResult(accessToken.token);
      } else {
        final refreshToken = await getRefreshToken();

        // if a refresh token found => request to refresh auth tokens
        if (refreshToken != null) {
          // return (await refreshAuthTokens(refreshToken)).mapSuccess(
          //   (result) => result.accessToken.token,
          // );
        }
        return FailureResult.withAppException(AppException.external);
      }
    } else {
      return FailureResult.withAppException(AppException.external);
    }
  }
}

class TokenNotFoundError extends AppError {
  final String tokenKey;

  TokenNotFoundError(this.tokenKey);

  @override
  String toString() {
    return 'token not found!';
  }
}
