import 'package:flutter/material.dart';
import 'package:books_genie/support/utils/context_extensions.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final void Function()? onSeeAllTap;

  const SectionHeader({super.key, required this.title, this.onSeeAllTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title.toUpperCase(),
        style: context.textTheme.titleMedium?.copyWith(
          color: context.colorScheme.onBackground,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: TextButton.icon(
        icon: const Icon(Icons.chevron_right_rounded),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            return context.colorScheme.secondary;
          }),
        ),
        onPressed: onSeeAllTap ?? () {},
        label: const Text("see all"),
      ),
    );
  }
}
