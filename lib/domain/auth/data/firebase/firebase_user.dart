import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:books_genie/domain/auth/base/base_user.dart';

class FirebaseUser extends BaseUser {
  const FirebaseUser({
    required super.id,
    required super.name,
    required super.createdAt,
    required super.isAnonymous,
    super.uid,
    super.phoneNumber,
    super.email,
    super.loggedIn,
  });

  factory FirebaseUser.fromFirebaseUserModel(firebase_auth.User user) {
    return FirebaseUser(
      id: user.uid.hashCode,
      uid: user.uid,
      name: user.displayName,
      createdAt: user.metadata.creationTime,
      phoneNumber: user.phoneNumber,
      isAnonymous: user.isAnonymous,
    );
  }
  FirebaseUser setIsLoggedIn(bool value) {
    return FirebaseUser(
      id: id,
      name: name,
      createdAt: createdAt,
      isAnonymous: isAnonymous,
      loggedIn: value,
    );
  }
}
