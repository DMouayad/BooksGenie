import 'package:books_genie/support/result/result.dart';
import 'base_user.dart';

abstract class BaseAuthProvider {
  const BaseAuthProvider();
}

abstract class BaseGoogleAuthProvider<T extends BaseUser>
    extends BaseAuthProvider {
  const BaseGoogleAuthProvider();
  Future<Result<T, AppError>> login();
}

abstract class BaseEmailPasswordAuthProvider<T extends BaseUser>
    extends BaseAuthProvider {
  const BaseEmailPasswordAuthProvider();

  Future<Result<T, AppError>> register({
    required String username,
    String? email,
    String? phoneNumber,
    required String password,
  });

  Future<Result<T, AppError>> login({
    required String emailOrPhoneNo,
    required String password,
  });

  FutureVoidResult requestPasswordReset(String email);
}

abstract class VerificationProvider<T extends BaseUser>
    extends BaseAuthProvider {
  FutureVoidResult sendVerificationEmail();
}

abstract class BaseAnonymousAuthProvider<T extends BaseUser>
    extends BaseAuthProvider {
  const BaseAnonymousAuthProvider();
  FutureResult<T> login({String? username});
}
