import 'package:firebase_auth/firebase_auth.dart';
import 'package:books_genie/domain/auth/base/base_auth_repository.dart';
import 'package:books_genie/domain/auth/data/firebase/firebase_auth_data_source.dart';

import 'firebase_user.dart';

class FirebaseAuthRepository
    extends BaseAuthRepository<FirebaseAuthDataSource, FirebaseUser> {
  FirebaseAuthRepository() : super(const FirebaseAuthDataSource()) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        usersStreamController.add(null);
        print('User is currently signed out!');
      } else {
        usersStreamController.add(FirebaseUser.fromFirebaseUserModel(user));
        print('User is signed in!');
      }
    });
  }
}
