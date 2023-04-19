part of '../auth_bloc.dart';

class AuthStatusCheckRequested extends AuthEvent {
  final BaseUser? user;

  const AuthStatusCheckRequested(this.user);

  @override
  Future<void> handle(
    BaseAuthRepository repository,
    AuthState state,
    Emitter<AuthState> emit,
  ) async {
    await Future.delayed(const Duration(milliseconds: 200), () {
      if (user != null) {
        emit(AuthHasLoggedInUser(user!));
      } else {
        if (state is! AuthHasNoLoggedInUser) {
          emit(const AuthHasNoLoggedInUser());
        }
      }
    });
  }
}
