import 'dart:async';

import 'package:books_genie/domain/auth/base/auth_providers.dart';
import 'package:books_genie/domain/auth/utils/signup_method.dart';
import 'package:books_genie/support/result/result.dart';
import 'package:books_genie/support/utils/extensions.dart';
import '../utils/login_method.dart';
import 'base_auth_data_source.dart';
import 'base_user.dart';

abstract class BaseAuthRepository<D extends BaseAuthDataSource<U>,
    U extends BaseUser> {
  final D dataSource;

  List<BaseAuthProvider> get _authProviders =>
      dataSource.authProviders.toList();
  BaseAuthRepository(this.dataSource) {
    usersStreamController = StreamController.broadcast();
  }

  U? currentUser;

  late final StreamController<U?> usersStreamController;

  Stream<U?> get usersStream => usersStreamController.stream;

  FutureResult<U> login(LoginMethod loginMethod) async {
    if (currentUser != null) {
      await dataSource.logout(currentUser!);
    }

    return await Result.fromStream((sink) async {
      Result<U, AppError>? loginResponse = await _resolveLogin(loginMethod);
      if (loginResponse != null) {
        sink.add(_handleUserResult(loginResponse));
      }
      sink.addError(AppError(appException: AppException.actionNotSupported));
    });
  }

  Future<Result<U, AppError>?> _resolveLogin(LoginMethod loginMethod) async {
    if (loginMethod is EmailPasswordLoginMethod) {
      final provider = _getAuthProvider<BaseEmailPasswordAuthProvider<U>>();
      return await provider.login(
        emailOrPhoneNo: loginMethod.emailOrPhoneNumber,
        password: loginMethod.password,
      );
    } else if (loginMethod is AnonymousLoginMethod) {
      final provider = _getAuthProvider<BaseAnonymousAuthProvider<U>>();
      return await provider.login();
    } else if (loginMethod is GoogleLoginMethod) {
      final provider = _getAuthProvider<BaseGoogleAuthProvider<U>>();
      return await provider.login();
    }
    return null;
  }

  U _handleUserResult(Result<U, AppError> result) {
    return result.mapTo(
      onSuccess: (user) {
        currentUser = user;
        usersStreamController.add(user);
        return user;
      },
      onFailure: (error) => throw error,
    );
  }

  /// returns a [BaseAuthProvider], with the specified type, from the data source auth providers
  ///
  /// Throws [AppError] if non was found
  T _getAuthProvider<T extends BaseAuthProvider>() {
    final provider = _authProviders.whereType<T>().firstOrNull as T?;
    if (provider == null) {
      throw AppError(appException: AppException.actionNotSupported);
    }
    return provider;
  }

  FutureResult<U> signup(SignupMethod method) async {
    return await Result.fromStream((sink) async {
      if (method is EmailSignupMethod || method is PhoneNumberSignupMethod) {
        final provider = _getAuthProvider<BaseEmailPasswordAuthProvider<U>>();
        final registerResult = await provider.register(
          username: method.username,
          password: method.password,
          email: method.email,
          phoneNumber: method.phoneNumber,
        );
        sink.add(_handleUserResult(registerResult));
      }

      sink.addError(AppError(appException: AppException.actionNotSupported));
    });
  }

  FutureVoidResult logout() async {
    if (currentUser == null) {
      usersStreamController.add(null);
      return SuccessResult.voidResult();
    }
    return (await dataSource.logout(currentUser!)).fold(
      ifSuccess: (_) => usersStreamController.add(null),
    );
  }

  FutureVoidResult onInit() async {
    return (await dataSource.loadUser()).mapSuccessToVoid(
      onSuccess: (user) {
        print(user);
        usersStreamController.add(user);
      },
    );
  }

  FutureVoidResult resetAuth() async {
    final resetAuthResult = await dataSource.resetAuth();
    return resetAuthResult.fold(ifSuccess: (_) {
      usersStreamController.add(null);
    });
  }
}
