part of '../auth_bloc.dart';

class LogoutInProgress extends AuthState {
  const LogoutInProgress();
}

class LogoutSuccess extends AuthState {
  const LogoutSuccess();
}

class LogoutFailed extends AuthState {
  const LogoutFailed(this.error);
  final AppError error;

  @override
  List<Object> get props => [error];
}
