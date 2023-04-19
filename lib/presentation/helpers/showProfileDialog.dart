import 'package:books_genie/blocs/auth_bloc/auth_bloc.dart';
import 'package:books_genie/main.dart';
import 'package:books_genie/support/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';

Future<void> showProfileDialog(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: ((context) {
        return Dialog(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Container(
                constraints: BoxConstraints(
                  maxHeight: context.screenHeight * .7,
                  maxWidth: context.screenWidth * .8,
                  minWidth: context.isMobile ? 200 : 400,
                  minHeight: context.isMobile ? 250 : 400,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 28,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: () {
                    if (state is LoginInProgress) {
                      return [
                        Text(
                          "Logging You In, please wait",
                          style: context.textTheme.titleLarge?.copyWith(
                            color: context.colorScheme.onBackground,
                          ),
                        ),
                        const CircularProgressIndicator.adaptive(),
                      ];
                    }
                    if (state is AuthHasLoggedInUser) {
                      return <Widget>[
                        CircleAvatar(
                          radius: 28,
                          backgroundColor:
                              context.colorScheme.secondary.withOpacity(.8),
                          child: Icon(
                            Icons.person_outlined,
                            size: 28,
                            color: context.colorScheme.onPrimary,
                          ),
                        ),
                        Text(
                          "Logged in as ${state.currentUser.isAnonymous ? 'Anonymous' : state.currentUser.name ?? state.currentUser.email ?? ''}",
                        ),
                        _CustomButton(
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(const LogoutRequested());
                          },
                          iconData: Icons.logout,
                          label: "Logout",
                        ),
                      ];
                    }

                    return _getLoginOptions(context);
                  }(),
                ),
              );
            },
          ),
        );
      }));
}

List<Widget> _getLoginOptions(BuildContext context) {
  return [
    const Icon(Icons.person_off_rounded, size: 28),
    const SizedBox(height: 20),
    Text(
      "You are not logged in!",
      style: context.textTheme.titleLarge,
    ),
    const SizedBox(height: 40),
    if (!kIsWindows)
      _CustomButton(
        onPressed: () {
          context.read<AuthBloc>().add(const LoginViaGoogleRequested());
        },
        iconData: FontAwesomeIcons.google,
        label: "Login with Google",
      ),
    _CustomButton(
      onPressed: () {
        context.read<AuthBloc>().add(const AnonymousLoginRequested());
      },
      iconData: FontAwesomeIcons.userShield,
      label: "Login Anonymously",
    ),
    _CustomButton(
      onPressed: () {
        // context.read<AuthBloc>().add(const LoginViaEmailRequested(
        //       emailOrPhoneNo: emailOrPhoneNo,
        //       password: password,
        //     ));
      },
      iconData: LineIcons.at,
      label: "Login with email\\password",
    ),
  ];
}

class _CustomButton extends StatelessWidget {
  final String label;
  final IconData iconData;
  final void Function() onPressed;

  const _CustomButton({
    required this.label,
    required this.iconData,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: FilledButton.icon(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateProperty.all(context.colorScheme.onPrimary),
        ),
        onPressed: onPressed,
        icon: Icon(iconData),
        label: Text(label),
      ),
    );
  }
}
