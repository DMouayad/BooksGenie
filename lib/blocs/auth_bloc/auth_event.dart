part of 'auth_bloc.dart';

abstract class AuthEvent extends BaseBlocEvent<BaseAuthRepository, AuthState> {
  const AuthEvent();
}
