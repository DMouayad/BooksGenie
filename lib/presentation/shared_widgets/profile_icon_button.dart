import 'package:books_genie/presentation/helpers/showProfileDialog.dart';
import 'package:flutter/material.dart';
import 'package:books_genie/support/utils/context_extensions.dart';

class ProfileIconButton extends StatelessWidget {
  const ProfileIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      onPressed: () => showProfileDialog(context),
      icon: Icon(
        Icons.person_rounded,
        size: 22,
        color: context.colorScheme.onPrimaryContainer,
      ),
    );
  }
}
