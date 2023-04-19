import 'package:books_genie/domain/auth/base/base_user.dart';
import 'package:isar/isar.dart';
part 'isar_user.g.dart';

/// An app user that is created only locally (offline).
@Collection(ignore: {'props', 'uid', 'stringify'})
class IsarUser implements BaseUser {
  IsarUser({
    this.id,
    this.email,
    this.phoneNumber,
    this.name,
    this.password,
    this.createdAt,
    this.loggedIn = false,
    this.isAnonymous = false,
  }) : assert(name != null || email != null || phoneNumber != null);

  @override
  Id? id;

  @override
  final DateTime? createdAt;

  @override
  @Index(unique: true)
  final String? email;

  @override
  final String? name;

  @override
  @Index(unique: true)
  final String? password;

  @override
  @Index(unique: true)
  final String? phoneNumber;

  @override
  @ignore
  List<Object?> get props => [
        id,
        createdAt,
        email,
        phoneNumber,
        password,
        name,
        loggedIn,
        isAnonymous
      ];

  @override
  String? get uid => null;

  @override
  @ignore
  bool? get stringify => true;

  @override
  final bool isAnonymous;

  @override
  final bool loggedIn;

  IsarUser copyWith({
    Id? id,
    DateTime? createdAt,
    String? email,
    String? name,
    String? password,
    String? phoneNumber,
    bool? isAnonymous,
    bool? loggedIn,
  }) {
    return IsarUser(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isAnonymous: isAnonymous ?? this.isAnonymous,
      loggedIn: loggedIn ?? this.loggedIn,
    );
  }
}
