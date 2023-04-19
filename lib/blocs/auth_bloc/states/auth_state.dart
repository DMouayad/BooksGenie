part of '../auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthHasLoggedInUser extends AuthState {
  final BaseUser currentUser;
  const AuthHasLoggedInUser(this.currentUser);
  @override
  List<Object> get props => [currentUser];
  @override
  String toString() {
    return '''<$runtimeType>
                 ${currentUser.runtimeType}
                    [created at: ${currentUser.createdAt}]''';
  }
}

class AuthHasNoLoggedInUser extends AuthState {
  final AppError? error;
  const AuthHasNoLoggedInUser({this.error});

  @override
  List<Object?> get props => [error];
}

class AuthErrorState extends AuthState {
  final AppError error;
  const AuthErrorState(this.error);

  @override
  List<Object> get props => [error];
}
