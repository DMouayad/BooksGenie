part of '../auth_bloc.dart';

class SignUpRequested extends AuthEvent {
  final String? email;
  final String? phoneNumber;
  final String username;
  final String password;

  const SignUpRequested._({
    this.email,
    this.phoneNumber,
    required this.username,
    required this.password,
  }) : assert(email != null || phoneNumber != null);
  factory SignUpRequested.withEmail({
    required String email,
    required String username,
    required String password,
  }) = SignUpRequested._;
  factory SignUpRequested.withPhoneNumber({
    required String username,
    required String password,
    required String phoneNumber,
  }) = SignUpRequested._;

  @override
  Future<void> handle(
    BaseAuthRepository repository,
    AuthState state,
    Emitter<AuthState> emit,
  ) async {
    if (state != const SignUpInProgress()) {
      emit(const SignUpInProgress());

      final signUpResponse = await repository.signup(
        email != null
            ? SignupMethod.email(
                email: email!,
                username: username,
                password: password,
              )
            : SignupMethod.phoneNumber(
                username: username,
                password: password,
                phoneNumber: phoneNumber!,
              ),
      );

      final signUpState = signUpResponse.mapTo(
        onSuccess: (_) => const SignUpSuccess(),
        onFailure: (error) {
          if (error.appException == AppException.emailAlreadyRegistered) {
            return EmailAlreadySignedUp();
          }
          return SignUpErrorState(error);
        },
      );
      emit(signUpState);
    }
  }
}
