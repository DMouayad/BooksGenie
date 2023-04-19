import 'package:books_genie/domain/book/base/entities/base_book.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:books_genie/support/utils/context_extensions.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.book,
    this.textOpacity = 1,
    this.imageBuilder,
    this.imageHeight = 230,
    this.imageWidth = 160,
    this.imageBottomPadding = 0,
    this.textAlign = TextAlign.start,
    this.subtitleFontSize,
    this.titleFontSize,
  });

  final double textOpacity;
  final double imageWidth;
  final double imageHeight;
  final double? titleFontSize;
  final double? subtitleFontSize;
  final TextAlign textAlign;
  final Widget Function(Widget image)? imageBuilder;
  final double imageBottomPadding;
  final BaseBook book;

  @override
  Widget build(BuildContext context) {
    final image = Card(
      elevation: 10,
      shape: const RoundedRectangleBorder(),
      child: book.info.thumbnailImageLink != null
          ? ExtendedImage.network(
              book.info.thumbnailImageLink!,
              cache: true,
              fit: BoxFit.fill,
              height: imageHeight,
              width: imageWidth,
            )
          : Opacity(
              opacity: .8,
              child: Image.asset(
                'assets/icons/icon_tran.png',
                fit: BoxFit.fill,
                height: imageHeight,
                width: imageWidth,
                repeat: ImageRepeat.repeat,
              ),
            ),
    );
    final isVerticalAligned = textAlign == TextAlign.center;
    return Hero(
      tag: book.id ?? book.googleBookId ?? book.info.title,
      child: SizedBox(
        height: imageHeight + 100,
        // width: ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imageBuilder != null ? imageBuilder!(image) : image,
            SizedBox(height: imageBottomPadding),
            Expanded(
              child: Opacity(
                opacity: textOpacity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: Material(
                    type: MaterialType.transparency,
                    child: Wrap(
                      direction:
                          isVerticalAligned ? Axis.vertical : Axis.horizontal,
                      alignment: isVerticalAligned
                          ? WrapAlignment.spaceAround
                          : WrapAlignment.start,
                      runAlignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: isVerticalAligned ? 0 : double.infinity,
                      runSpacing: 5,
                      children: [
                        Text(
                          book.info.title.length >= 40
                              ? '${book.info.title.substring(0, 30)}-\n${book.info.title.substring(30)}'
                              : book.info.title,
                          textAlign: textAlign,
                          style: context.textTheme.titleMedium?.copyWith(
                            fontSize: titleFontSize,
                            color: context.colorScheme.onBackground,
                          ),
                        ),
                        Text(
                          "by ${book.info.authors.fold('', (previousValue, element) => '$previousValue, $element')}",
                          textAlign: textAlign,
                          style: context.textTheme.bodySmall?.copyWith(
                            fontFamily: "merriweather",
                            color: context.colorScheme.tertiary,
                            fontSize: subtitleFontSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
