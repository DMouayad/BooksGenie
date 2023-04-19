import 'dart:async';

import 'package:books_genie/domain/auth/utils/login_method.dart';
import 'package:books_genie/domain/auth/utils/signup_method.dart';
import 'package:books_genie/support/services/logger_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_genie/domain/auth/base/base_auth_repository.dart';
import 'package:books_genie/domain/auth/base/base_user.dart';
import 'package:books_genie/support/result/result.dart';

import '../base_event.dart';

part 'states/auth_state.dart';

part 'states/sign_up_state.dart';

part 'auth_event.dart';

part 'states/login_state.dart';

part 'states/auth_init_state.dart';

part 'states/auth_reset_state.dart';

part 'states/logout_state.dart';
part 'states/auth_method_not_supported.dart';

part 'events/login_via_email_requested.dart';
part 'events/anonymous_login_requested.dart';

part 'events/signup_requested.dart';

part 'events/auth_init_requested.dart';

part 'events/logout_requested.dart';
part 'events/login_via_google_requested.dart';
part 'events/auth_status_check_requested.dart';

part 'events/reset_auth_state.dart';

/// Manages
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final BaseAuthRepository authRepository;
  late final StreamSubscription<BaseUser?> _usersStreamSub;

  AuthBloc(this.authRepository) : super(const AuthInitial()) {
    _usersStreamSub = authRepository.usersStream.listen((user) {
      add(AuthStatusCheckRequested(user));
    });
    on<AuthEvent>(
        (event, emit) async => await event.handle(authRepository, state, emit));
  }

  @override
  Future<void> close() async {
    await _usersStreamSub.cancel();
    return super.close();
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    Log.logBlocTransition(this, transition);
    super.onTransition(transition);
  }
}
