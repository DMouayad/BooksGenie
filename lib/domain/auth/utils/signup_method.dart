abstract class SignupMethod {
  final String username;
  final String password;
  final String? email;
  final String? phoneNumber;

  const SignupMethod({
    this.email,
    this.phoneNumber,
    required this.username,
    required this.password,
  }) : assert(email != null || phoneNumber != null);

  factory SignupMethod.email({
    required String email,
    required String username,
    required String password,
  }) = EmailSignupMethod._;
  factory SignupMethod.phoneNumber({
    required String username,
    required String password,
    required String phoneNumber,
  }) = PhoneNumberSignupMethod._;
}

class EmailSignupMethod extends SignupMethod {
  const EmailSignupMethod._({
    required super.email,
    required super.username,
    required super.password,
  });
}

class PhoneNumberSignupMethod extends SignupMethod {
  const PhoneNumberSignupMethod._({
    required super.phoneNumber,
    required super.username,
    required super.password,
  });
}
