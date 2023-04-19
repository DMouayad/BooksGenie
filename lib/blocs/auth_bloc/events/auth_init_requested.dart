part of '../auth_bloc.dart';

class AuthInitRequested extends AuthEvent {
  const AuthInitRequested();

  @override
  Future<void> handle(
    BaseAuthRepository repository,
    AuthState state,
    Emitter<AuthState> emit,
  ) async {
    if (state is! AuthInitInProgress) {
      emit(const AuthInitInProgress());

      final authInitState = (await repository.onInit()).mapTo(
        onSuccess: (_) => null,
        onFailure: (error) {
          return AuthInitFailed(error);
        },
      );
      if (authInitState != null) {
        emit(authInitState);
      }
    }
  }
}
