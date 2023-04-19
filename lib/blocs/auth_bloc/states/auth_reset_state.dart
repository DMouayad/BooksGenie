part of '../auth_bloc.dart';

class AuthStateResetSuccess extends AuthState {
  const AuthStateResetSuccess();
}

class AuthStateResetFailed extends AuthErrorState {
  const AuthStateResetFailed(super.error);
}
