import 'package:books_genie/support/utils/context_extensions.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  final String aboutText;
  final int pageCount;
  final DateTime? publishedDate;

  const AboutSection({
    super.key,
    required this.aboutText,
    required this.pageCount,
    required this.publishedDate,
  });

  @override
  Widget build(BuildContext context) {
    final titleTextStyle = context.textTheme.titleMedium?.copyWith(
      color: context.colorScheme.onBackground,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About the book",
            textAlign: TextAlign.start,
            style: titleTextStyle,
          ),
          const SizedBox(height: 16),
          Text(
            aboutText,
            style: context.textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Published Date",
              style: titleTextStyle,
            ),
            subtitle: Text(publishedDate?.year.toString() ?? '-'),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "Page Count",
              style: titleTextStyle,
            ),
            subtitle: Text(pageCount.toString()),
          ),
        ],
      ),
    );
  }
}
