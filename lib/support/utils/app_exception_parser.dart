import 'package:books_genie/support/error/app_exception.dart';

class AppExceptionParser {
  static AppException fromFirebaseExceptionCode(String code) {
    switch (code) {
      case "email-already-in-use":
        return AppException.emailAlreadyRegistered;
      case "invalid-email":
        return AppException.invalidEmailCredential;
      case "operation-not-allowed":
        return AppException.external;
      case "user-not-found":
        return AppException.invalidEmailCredential;
      case "weak-password":
        return AppException.weekCredentialPassword;
      case "wrong-password":
        return AppException.invalidPasswordCredential;
      case "unavailable":
        return AppException.cannotConnectToServer;
      default:
        return AppException.external;
    }
  }
}
