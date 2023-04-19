import 'package:books_genie/support/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showLoginRequiredDialog(BuildContext context, String contentText) {
  showDialog(
    context: context,
    builder: ((context) {
      return AlertDialog(
        title: Text(
          'Login Required!',
          textAlign: TextAlign.center,
          style: context.textTheme.titleLarge?.copyWith(
            color: Colors.red.shade400,
          ),
        ),
        content: Text(
          contentText,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onBackground,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('OK'),
          ),
        ],
      );
    }),
  );
}
