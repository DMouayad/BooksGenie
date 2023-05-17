import 'package:books_genie/domain/book/base/entities/base_book.dart';
import 'package:flutter/material.dart';
import 'package:books_genie/presentation/shared_widgets/book_card.dart';
import 'package:go_router/go_router.dart';

class ClickableBookCard extends StatefulWidget {
  final double textOpacity;
  final double imageWidth;
  final double imageHeight;
  final double? titleFontSize;
  final double? subtitleFontSize;
  final TextAlign textAlign;
  final Widget Function(Widget image)? imageBuilder;
  final double imageBottomPadding;
  final BaseBook book;

  const ClickableBookCard({
    super.key,
    required this.book,
    this.textOpacity = 1,
    this.imageHeight = 220,
    this.imageWidth = 160,
    this.imageBottomPadding = 0,
    this.textAlign = TextAlign.start,
    this.titleFontSize,
    this.subtitleFontSize,
    this.imageBuilder,
  });

  @override
  State<ClickableBookCard> createState() => _ClickableBookCardState();
}

class _ClickableBookCardState extends State<ClickableBookCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> pulseAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 170),
    );

    pulseAnimation = Tween<double>(begin: 1, end: .9).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.easeInOutSine),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          _animationController.forward(from: 0).then((value) {
            _animationController.reverse().then((value) {
              context.goNamed(
                "book-details",
                pathParameters: {"bookId": widget.book.id!},
              );
            });
          });
        });
      },
      child: BookCard(
        book: widget.book,
        textOpacity: widget.textOpacity,
        subtitleFontSize: widget.subtitleFontSize,
        textAlign: widget.textAlign,
        titleFontSize: widget.titleFontSize,
        imageWidth: widget.imageWidth,
        imageHeight: widget.imageHeight,
        imageBottomPadding: widget.imageBottomPadding,
        imageBuilder: ((image) {
          return ScaleTransition(
            scale: pulseAnimation,
            child: image,
          );
        }),
      ),
    );
  }
}
