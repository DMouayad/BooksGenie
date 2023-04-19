part of '../auth_bloc.dart';

class AnonymousLoginRequested extends AuthEvent {
  const AnonymousLoginRequested();

  @override
  Future<void> handle(
    BaseAuthRepository repository,
    AuthState state,
    Emitter<AuthState> emit,
  ) async {
    if (state is! LoginInProgress) {
      emit(const LoginInProgress());
      final loginState = await () async {
        final loginResponse = await repository.login(LoginMethod.anonymous());
        return loginResponse.mapTo(
          onSuccess: (_) => const LoginSuccess(),
          onFailure: (error) => LoginErrorState.from(error),
        );
      }();
      emit(loginState);
    }
  }
}
