abstract class LoginMethod {
  const LoginMethod();

  factory LoginMethod.viaGoogle() = GoogleLoginMethod._;
  factory LoginMethod.anonymous({String? username}) = AnonymousLoginMethod._;

  factory LoginMethod.email({
    required String emailOrPhoneNumber,
    required String password,
  }) = EmailPasswordLoginMethod._;
}

class EmailPasswordLoginMethod extends LoginMethod {
  final String emailOrPhoneNumber;
  final String password;

  const EmailPasswordLoginMethod._(
      {required this.emailOrPhoneNumber, required this.password});
}

class AnonymousLoginMethod extends LoginMethod {
  final String? username;

  const AnonymousLoginMethod._({this.username});
}

class GoogleLoginMethod extends LoginMethod {
  const GoogleLoginMethod._();
}
