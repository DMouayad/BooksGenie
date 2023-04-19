part of '../auth_bloc.dart';

class LoginViaGoogleRequested extends AuthEvent {
  const LoginViaGoogleRequested();

  @override
  Future<void> handle(
    BaseAuthRepository repository,
    AuthState state,
    Emitter<AuthState> emit,
  ) async {
    if (state != const LoginInProgress()) {
      emit(const LoginInProgress());
      final loginState = await () async {
        final loginResponse = await repository.login(LoginMethod.viaGoogle());
        return loginResponse.mapTo(
          onSuccess: (_) => const LoginSuccess(),
          onFailure: (error) => LoginErrorState.from(error),
        );
      }();
      emit(loginState);
    }
  }
}
