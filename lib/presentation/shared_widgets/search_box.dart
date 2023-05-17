import 'package:books_genie/support/utils/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
    this.searchHint = 'Search...',
    this.onChanged,
    this.onSubmitted,
    this.searchEnabled = true,
    required this.controller,
  });

  final String searchHint;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSubmitted;
  final bool searchEnabled;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      controller: controller,
      enabled: searchEnabled,
      prefixInsets: const EdgeInsets.fromLTRB(10, 0, 5, 0),
      padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
      placeholder: searchHint,
      autofocus: false,
      style: context.textTheme.bodyLarge,
      placeholderStyle: context.textTheme.bodyMedium?.copyWith(
        color: context.isDarkMode
            ? Colors.white70
            : context.colorScheme.onBackground.withOpacity(.8),
      ),
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: context.colorScheme.onBackground.withOpacity(.1),
          )
        ],
        color: context.colorScheme.background,
      ),
    );
  }
}
