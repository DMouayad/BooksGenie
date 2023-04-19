part of '../auth_bloc.dart';

class LoginInProgress extends AuthState {
  const LoginInProgress();
}

class LoginErrorState extends AuthErrorState {
  const LoginErrorState._(super.error);

  static AuthErrorState from(AppError error) {
    if (error.appException == AppException.actionNotSupported) {
      return AuthMethodNotSupported('Email\\Password');
    }
    if (error.appException == AppException.invalidPasswordCredential) {
      return LoginPasswordIsIncorrect();
    }
    if (error.appException == AppException.invalidEmailCredential) {
      return LoginEmailNotFound();
    }
    return LoginErrorState._(error);
  }
}

class LoginEmailNotFound extends LoginErrorState {
  LoginEmailNotFound()
      : super._(
          AppError(appException: AppException.invalidEmailCredential),
        );
}

class LoginPasswordIsIncorrect extends LoginErrorState {
  LoginPasswordIsIncorrect()
      : super._(
          AppError(appException: AppException.invalidPasswordCredential),
        );
}

class LoginUsernameNotRegistered extends LoginErrorState {
  LoginUsernameNotRegistered()
      : super._(
          AppError(appException: AppException.usernameNotRegistered),
        );
}

class LoginSuccess extends AuthState {
  const LoginSuccess();
}
