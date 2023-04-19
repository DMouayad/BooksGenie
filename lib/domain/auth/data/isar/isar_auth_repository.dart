import 'package:books_genie/domain/auth/base/base_auth_repository.dart';
import 'package:books_genie/domain/auth/data/isar/isar_auth_data_source.dart';
import 'package:books_genie/domain/auth/data/isar/isar_user.dart';

class IsarAuthRepository
    extends BaseAuthRepository<IsarAuthDataSource, IsarUser> {
  IsarAuthRepository() : super(const IsarAuthDataSource());
}
