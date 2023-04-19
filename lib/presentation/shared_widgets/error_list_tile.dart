import 'package:books_genie/support/error/app_error.dart';
import 'package:books_genie/support/utils/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorListTile extends StatelessWidget {
  final AppError error;
  final String title;

  final void Function() onRetry;

  const ErrorListTile({
    super.key,
    required this.error,
    required this.title,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        tileColor: context.colorScheme.primaryContainer,
        title: Text(title),
        leading: Icon(
          Icons.error_rounded,
          color: Colors.redAccent.shade200,
        ),
        trailing: IconButton(
          onPressed: onRetry,
          icon: const Icon(CupertinoIcons.refresh_thin),
        ),
        subtitle: Text(error.message ?? "unknown error"),
      ),
    );
  }
}
