import 'dart:math';

import 'package:books_genie/domain/book/base/entities/base_book.dart';
import 'package:flutter/material.dart';
import 'package:books_genie/presentation/shared_widgets/builders/context_builder.dart';
import 'package:books_genie/presentation/shared_widgets/builders/context_widget_builder.dart';
import 'package:books_genie/presentation/shared_widgets/clickable_book_card.dart';
import 'package:books_genie/support/utils/context_extensions.dart';

class BooksSwipeList extends StatefulWidget {
  const BooksSwipeList({
    super.key,
    required this.books,
    this.height,
  });
  final List<BaseBook> books;
  final double? height;

  @override
  _BooksSwipeListState createState() => _BooksSwipeListState();
}

const SCALE_FRACTION = .7;
const FULL_SCALE = 1.0;

class _BooksSwipeListState extends State<BooksSwipeList> {
  final double viewPortFraction = .5;
  late final PageController pageController =
      PageController(initialPage: 1, viewportFraction: viewPortFraction);

  @override
  Widget build(BuildContext context) {
    final listHeight = widget.height ??
        min(
            350,
            (context.isLandscapeMode
                    ? context.screenWidth
                    : context.screenHeight) *
                .4);
    return SizedBox(
      height: listHeight,
      child: ContextWidgetBuilder(
        ContextBuilder(
          mobileScreenChild: _MobileList(
            books: widget.books,
            pageController: pageController,
            listHeight: listHeight,
          ),
          defaultChild:
              _DefaultList(listHeight: listHeight, books: widget.books),
        ),
      ),
    );
  }
}

class _DefaultList extends StatelessWidget {
  final double listHeight;
  final List<BaseBook> books;

  const _DefaultList({
    required this.listHeight,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: listHeight,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 180,
            child: ClickableBookCard(book: books[index], imageWidth: 180),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 12);
        },
      ),
    );
  }
}

class _MobileList extends StatelessWidget {
  final PageController pageController;
  final double listHeight;
  final List<BaseBook> books;

  const _MobileList({
    required this.pageController,
    required this.books,
    required this.listHeight,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: books.length,
      physics: const ClampingScrollPhysics(),
      controller: pageController,
      itemBuilder: (BuildContext context, int index) {
        return FutureBuilder<PageController>(
            future: Future.delayed(const Duration(milliseconds: 10), () {
              return pageController;
            }),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox.shrink();
              }
              return AnimatedBuilder(
                animation: snapshot.data!,
                builder: (BuildContext context, Widget? child) {
                  final imageHeight = min(240.0, listHeight - 80.0);
                  final page = pageController.page!;
                  final d = index - page;

                  if (index == page.floor() || index == page.floor() - 1) {
                    final double opacity =
                        min(1, 1 + (d + .7)).abs().toDouble();
                    final double scale = min(1, 1 + (d + .9));
                    return Transform.scale(
                      scale: scale,
                      child: Transform.translate(
                        offset: Offset(d * -114, 0),
                        child: Opacity(
                          opacity: opacity,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            child: ClickableBookCard(
                              book: books[index],
                              imageHeight: imageHeight,
                              imageWidth: 180,
                              // imageWidth: min(190, imageHeight * (itemScale)),
                              textOpacity: min(1, 1 + (d)).abs().toDouble(),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ClickableBookCard(
                      book: books[index],
                      imageHeight: imageHeight,
                      // imageWidth: imageHeight * itemScale,
                      imageWidth: 180,
                    ),
                  );
                },
              );
            });
      },
    );
  }
}
