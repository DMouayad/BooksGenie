import 'package:books_genie/domain/book/base/entities/base_book.dart';
import 'package:books_genie/presentation/screens/book_details/components/favorite_button.dart';
import 'package:books_genie/support/services/url_launcher_service.dart';
import 'package:books_genie/support/utils/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//
import 'package:books_genie/presentation/shared_widgets/fade_slide_transition.dart';
import 'package:books_genie/presentation/shared_widgets/profile_icon_button.dart';

import 'components/about_section.dart';
import 'components/average_rating_component.dart';
import 'components/book_cover.dart';
import 'components/bottom_fixed_buttons.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({required this.book, super.key});
  final BaseBook? book;

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen>
    with SingleTickerProviderStateMixin {
  late final ScrollController scrollController = ScrollController();
  late final AnimationController animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 700))
    ..forward();

  late final positionAnimation = Tween<Offset>(
    begin: const Offset(0.0, .8),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: animationController,
    curve: const Interval(0.3, 1, curve: Curves.fastOutSlowIn),
  ));

  late final fadeAnimation =
      Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
    parent: animationController,
    curve: const Interval(0.0, 1, curve: Curves.easeInOutCirc),
  ));

  @override
  void dispose() {
    animationController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: ProfileIconButton(),
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            if (widget.book == null)
              const Center(
                child: Text("Failed to load the book info!"),
              )
            else
              ListView(
                controller: scrollController,
                padding: const EdgeInsets.only(bottom: 120),
                children: [
                  BookCover(widget.book!),
                  const SizedBox(height: 10),
                  SlideTransition(
                    position: positionAnimation,
                    child: FadeTransition(
                      opacity: fadeAnimation,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AverageRatingComponent(
                            averageRating: widget.book!.info.averageRating,
                            ratingsCount: widget.book!.info.ratingsCount,
                          ),
                          const SizedBox(height: 10),
                          _ButtonsBar(widget.book!),
                          const SizedBox(height: 30),
                          AnimatedBuilder(
                            animation: scrollController,
                            builder: (BuildContext context, Widget? child) {
                              return child!;
                            },
                            child: AboutSection(
                              aboutText: Bidi.stripHtmlIfNeeded(
                                  widget.book!.info.description),
                              pageCount: widget.book!.info.pageCount,
                              publishedDate: widget.book!.info.publishedDate,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            Positioned(
              bottom: 10,
              left: 20,
              right: 20,
              child: FadeSlideTransition(
                slideAnimation: positionAnimation,
                fadeAnimation: fadeAnimation,
                animate: true,
                child: BottomFixedButtons(
                  previewLink: widget.book!.info.previewLink,
                  buyLink: widget.book!.info.infoLink,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ButtonsBar extends StatelessWidget {
  const _ButtonsBar(this.book);
  final BaseBook book;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: context.isDarkMode ? Colors.white12 : Colors.black12),
        borderRadius: BorderRadius.circular(8),
      ),
      height: 54,
      // padding: const EdgeInsets.symmetric(vertical: 3),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceAround,
        children: [
          FavoriteButton(book),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.share_outlined),
            label: const Text("Share"),
          ),
          TextButton.icon(
            onPressed: () async {
              await UrlLauncherService.launchInExternalApp(
                  book.info.previewLink);
            },
            icon: const Icon(CupertinoIcons.text_bubble),
            label: const Text("Reviews"),
          ),
        ],
      ),
    );
  }
}
