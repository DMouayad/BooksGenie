import 'dart:math';

import 'package:books_genie/domain/book/base/entities/base_book.dart';
import 'package:books_genie/presentation/shared_widgets/book_card.dart';
import 'package:books_genie/support/utils/context_extensions.dart';
import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  final BaseBook book;
  const BookCover(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: BookCard(
          book: book,
          imageHeight: min(240, context.screenHeight * .5),
          imageBottomPadding: 12,
          textAlign: TextAlign.center,
          titleFontSize: 20,
          subtitleFontSize: 14,
          imageWidth: 185,
        ),
      ),
    );
  }
}
