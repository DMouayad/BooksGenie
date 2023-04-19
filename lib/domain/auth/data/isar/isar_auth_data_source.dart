import 'package:faker/faker.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
//
import 'package:books_genie/domain/auth/base/auth_providers.dart';
import 'package:books_genie/domain/auth/base/base_auth_data_source.dart';
import 'package:books_genie/domain/auth/data/isar/isar_user.dart';
import 'package:books_genie/support/result/result.dart';

class IsarAuthDataSource extends BaseAuthDataSource<IsarUser> {
  const IsarAuthDataSource()
      : super(authProviders: const {
          IsarAnonymousAuthProvider(),
          IsarEmailPasswordAuthProvider()
        });
  Isar get _isar => GetIt.instance.get();

  @override
  Future<Result<IsarUser?, AppError>> loadUser() async {
    return await Result.fromAsync(() async {
      return await _isar.txn(
        () async =>
            await _isar.isarUsers.filter().loggedInEqualTo(true).findFirst(),
      );
    });
  }

  @override
  FutureVoidResult logout(IsarUser user) async {
    return await Result.fromAsync(() async {
      return await _isar.writeTxn(() async {
        user = user.copyWith(loggedIn: false);
        await _isar.isarUsers.put(user);
        return const VoidValue();
      });
    });
  }

  @override
  FutureVoidResult resetAuth() async {
    return (await Result.fromAsync(() async => _isar.isarUsers.clear()))
        .mapSuccessToVoid();
  }
}

class IsarEmailPasswordAuthProvider
    extends BaseEmailPasswordAuthProvider<IsarUser> {
  const IsarEmailPasswordAuthProvider();

  Isar get _isar => GetIt.instance.get();

  @override
  Future<Result<IsarUser, AppError>> login({
    required String emailOrPhoneNo,
    required String password,
  }) async {
    return await Result.fromStream((sink) async {
      _isar.txn(() async {
        return await _isar.isarUsers
            .where()
            .passwordEqualTo(_hashPassword(password))
            .filter()
            .phoneNumberEqualTo(emailOrPhoneNo)
            .or()
            .emailEqualTo(emailOrPhoneNo)
            .findFirst();
      }).then(
        (user) => (user == null)
            ? sink.addError(
                AppError(appException: AppException.invalidEmailCredential))
            : sink.add(user),
      );
    });
  }

  @override
  Future<Result<IsarUser, AppError>> register({
    required String username,
    String? email,
    String? phoneNumber,
    required String password,
  }) async {
    return await Result.fromAsync(() async {
      return await _isar.writeTxn(() async {
        final IsarUser user = IsarUser(
          email: email,
          phoneNumber: phoneNumber,
          password: _hashPassword(password),
          loggedIn: true,
          name: username,
        );
        await _isar.isarUsers.put(user);
        return user;
      });
    });
  }

  @override
  FutureVoidResult requestPasswordReset(String email) {
    // TODO: implement requestPasswordReset
    throw UnimplementedError();
  }

  String _hashPassword(String password) {
    final key = utf8.encode('p@ssw0rd');
    final bytes = utf8.encode(password);
    return Hmac(sha256, key).convert(bytes).toString();
  }

  bool verifyPasswordHash(String hash, String password) {
    return _hashPassword(password) == hash;
  }
}

class IsarAnonymousAuthProvider extends BaseAnonymousAuthProvider<IsarUser> {
  Isar get _isar => GetIt.instance.get();
  const IsarAnonymousAuthProvider();

  @override
  FutureResult<IsarUser> login({String? username}) async {
    return await Result.fromAsync(() async {
      // check if there's a user in the db
      IsarUser? user = await _isar.isarUsers
          .filter()
          .optional(username != null, (q) => q.nameEqualTo(username))
          .isAnonymousEqualTo(true)
          .findFirst();
      if (user == null) {
        user = IsarUser(
          name: username ?? Faker().person.name(),
          createdAt: DateTime.now(),
          loggedIn: true,
          isAnonymous: true,
        );
        await _isar.writeTxn(() async {
          await _isar.isarUsers.put(user!);
        });
      }
      return user;
    });
  }
}
