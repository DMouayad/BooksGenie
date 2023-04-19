import 'dart:math';

import 'package:flutter/material.dart';
import 'package:books_genie/presentation/shared_widgets/page_section.dart';
import 'package:books_genie/support/constants/books_categories.dart';
import 'package:books_genie/support/utils/context_extensions.dart';

import 'category_card.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    super.key,
    required this.slideAnimation,
    required this.fadeAnimation,
  });
  final Animation<Offset>? slideAnimation;
  final Animation<double>? fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return PageSection(
      fadeAnimation: fadeAnimation,
      slideAnimation: slideAnimation,
      title: 'categories',
      body: SizedBox(
        height: min(115, context.screenHeight * .2),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: booksCategories.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 16);
          },
          padding: const EdgeInsets.symmetric(horizontal: 14),
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 220,
              child: CategoryCard(
                label: booksCategories[index],
                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}
