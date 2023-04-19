part of '../auth_bloc.dart';

class LoginViaEmailRequested extends AuthEvent {
  final String emailOrPhoneNo;
  final String password;

  const LoginViaEmailRequested(
      {required this.emailOrPhoneNo, required this.password});

  @override
  Future<void> handle(
    BaseAuthRepository repository,
    AuthState state,
    Emitter<AuthState> emit,
  ) async {
    if (state is! LoginInProgress) {
      emit(const LoginInProgress());
      final loginState = await () async {
        final loginResponse = await repository.login(LoginMethod.email(
          emailOrPhoneNumber: emailOrPhoneNo,
          password: password,
        ));
        return loginResponse.mapTo(
          onSuccess: (_) => const LoginSuccess(),
          onFailure: (error) => LoginErrorState.from(error),
        );
      }();
      emit(loginState);
    }
  }
}
