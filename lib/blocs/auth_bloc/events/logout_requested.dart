part of '../auth_bloc.dart';

class LogoutRequested extends AuthEvent {
  const LogoutRequested();

  @override
  Future<void> handle(BaseAuthRepository repository, AuthState state,
      Emitter<AuthState> emit) async {
    if (state is! LogoutInProgress) emit(const LogoutInProgress());
    final logoutState = (await repository.logout()).mapTo(
      onSuccess: (_) => const LogoutSuccess(),
      onFailure: (error) => LogoutFailed(error),
    );
    emit(logoutState);
  }
}
