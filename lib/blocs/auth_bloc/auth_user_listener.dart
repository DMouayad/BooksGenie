import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'auth_bloc.dart';

/// Listens to [AuthBloc]'s state changes,
/// Specifies all the actions triggered by an AuthState
class AuthUserListener extends StatelessWidget {
  const AuthUserListener(
    this.child, {
    Key? key,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthInitFailed) {
          _onAuthInitFailed(state, context);
        }
        if (state is AuthHasLoggedInUser) {
          // _onAuthHasUser(state, context);
        }
        if (state is AuthHasNoLoggedInUser) {
          _onAuthHasNoUser(context);
        }
      },
      child: child,
    );
  }

  void _onAuthHasNoUser(BuildContext context) {
    GoRouter.of(context).pushReplacementNamed("/");
  }

  void _onAuthInitFailed(AuthInitFailed state, BuildContext context) {}
}
