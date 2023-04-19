import 'package:books_genie/domain/auth/base/auth_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:books_genie/domain/auth/base/base_auth_data_source.dart';
import 'package:books_genie/support/result/result.dart';

import 'firebase_user.dart';

class FirebaseAuthDataSource extends BaseAuthDataSource<FirebaseUser> {
  const FirebaseAuthDataSource()
      : super(authProviders: const {
          FirebaseEmailAuthProvider(),
          FirebaseGoogleAuthProvided(),
          FirebaseAnonymousAuthProvider(),
        });

  @override
  Future<Result<FirebaseUser?, AppError>> loadUser() async {
    return await Result.fromAsync(() async {
      final user = FirebaseAuth.instance.currentUser;
      return user != null ? FirebaseUser.fromFirebaseUserModel(user) : null;
    });
  }

  @override
  FutureVoidResult logout(FirebaseUser user) async {
    return await _logout();
  }

  FutureVoidResult _logout() async {
    return Result.fromAsync(
      () async =>
          FirebaseAuth.instance.signOut().then((value) => const VoidValue()),
    );
  }

  @override
  FutureVoidResult resetAuth() async {
    return await _logout();
  }
}

Future<Result<FirebaseUser, AppError>> _handleCreatingUser({
  required Future<UserCredential> Function() userCredential,
  String userIsNullErrorMessage = "un error occurred",
}) async {
  return await Result.fromStream((sink) async {
    userCredential().then((credential) {
      final user = credential.user;

      (user == null)
          ? sink.addError(AppError(message: userIsNullErrorMessage))
          : sink.add(FirebaseUser.fromFirebaseUserModel(user));
    });
  });
}

class FirebaseEmailAuthProvider
    extends BaseEmailPasswordAuthProvider<FirebaseUser> {
  const FirebaseEmailAuthProvider();
  @override
  Future<Result<FirebaseUser, AppError>> login({
    required String emailOrPhoneNo,
    required String password,
  }) async {
    return await _handleCreatingUser(
      userCredential: () async {
        return await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailOrPhoneNo, password: password);
      },
      userIsNullErrorMessage: "Login Failed",
    );
  }

  @override
  Future<Result<FirebaseUser, AppError>> register({
    required String username,
    required String password,
    String? email,
    String? phoneNumber,
  }) async {
    assert(email != null);
    return await _handleCreatingUser(
      userCredential: () async {
        return await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email!, password: password);
      },
      userIsNullErrorMessage: "Registration Failed",
    );
  }

  @override
  FutureVoidResult requestPasswordReset(String email) {
    // TODO: implement requestPasswordReset
    throw UnimplementedError();
  }
}

class FirebaseGoogleAuthProvided extends BaseGoogleAuthProvider<FirebaseUser> {
  const FirebaseGoogleAuthProvided();
  @override
  Future<Result<FirebaseUser, AppError>> login() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      return FailureResult.withMessage("Login failed!");
    }
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in with a google account, return the user after getting
    // his [UserCredential]
    return await _handleCreatingUser(
      userCredential: () async =>
          await FirebaseAuth.instance.signInWithCredential(credential),
      userIsNullErrorMessage: "Login with a google account failed!",
    );
  }
}

@immutable
class FirebaseAnonymousAuthProvider
    extends BaseAnonymousAuthProvider<FirebaseUser> {
  const FirebaseAnonymousAuthProvider();
  @override
  FutureResult<FirebaseUser> login({String? username}) async {
    return await _handleCreatingUser(
      userCredential: () async =>
          await FirebaseAuth.instance.signInAnonymously(),
    );
  }
}
