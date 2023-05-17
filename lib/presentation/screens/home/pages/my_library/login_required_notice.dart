import 'package:books_genie/presentation/helpers/show_profile_dialog.dart';
import 'package:books_genie/support/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginRequiredNotice extends StatelessWidget {
  const LoginRequiredNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(FontAwesomeIcons.bookOpen),
          const SizedBox(height: 14),
          Text(
            "Login to your account to access your library!\n",
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colorScheme.onBackground,
            ),
          ),
          SizedBox(
            width: 150,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(
                  color: context.colorScheme.onBackground.withOpacity(.3),
                ),
              ),
              onPressed: () => showProfileDialog(context),
              child: const Text("Login"),
            ),
          ),
        ],
      ),
    );
  }
}
