import 'package:books_genie/support/result/result.dart';

import 'auth_providers.dart';
import 'base_user.dart';

abstract class BaseAuthDataSource<T extends BaseUser> {
  const BaseAuthDataSource({this.authProviders = const {}});
  final Set<BaseAuthProvider> authProviders;
  Future<Result<T?, AppError>> loadUser();
  FutureVoidResult logout(T user);
  FutureVoidResult resetAuth();
}
