part of '../auth_bloc.dart';

class AuthMethodNotSupported extends AuthErrorState {
  AuthMethodNotSupported(final String method)
      : super(
          AppError(message: 'Login with $method is not supported!'),
        );
}
