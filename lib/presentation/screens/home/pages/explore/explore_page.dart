import 'package:books_genie/domain/book/base/entities/base_book.dart';
import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//
import 'package:books_genie/blocs/auth_bloc/auth_bloc.dart';
import 'package:books_genie/blocs/library_bloc/library_bloc.dart';
import 'package:books_genie/presentation/shared_widgets/custom_app_bar.dart';
import 'package:books_genie/support/utils/context_extensions.dart';
import 'package:go_router/go_router.dart';

import 'categories_section.dart';
import 'most_popular_section.dart';
import 'recommended_section.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key, this.initAnimations});

  final ExplorePageInitAnimations? initAnimations;

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with SingleTickerProviderStateMixin {
  late final searchResultsListController = ScrollController();
  late final List<Widget> pageSections = [
    const SizedBox(height: 26),
    RecommendedBooksSection(
      slideAnimation: widget.initAnimations?.sectionSlideAnimation,
      fadeAnimation: widget.initAnimations?.sectionFadeAnimation,
    ),
    // const SizedBox(height: 36),
    CategoriesSection(
      slideAnimation: widget.initAnimations?.sectionSlideAnimation,
      fadeAnimation: widget.initAnimations?.sectionFadeAnimation,
    ),
    const SizedBox(height: 36),
    MostPopularSection(
      slideAnimation: widget.initAnimations?.sectionSlideAnimation,
      fadeAnimation: widget.initAnimations?.sectionFadeAnimation,
    ),
    const SizedBox(height: 14),
  ];

  late final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          controller: scrollController,
          slivers: [
            CustomAppbar(
              title: const _WelcomeMessage(),
              onSearch: (value) async {
                if (value != null && value.isNotEmpty) {
                  // Future.delayed(const Duration(seconds: 1), () {
                  context
                      .read<LibraryBloc>()
                      .add(LibrarySearchRequested(value));
                  // });
                } else {
                  context
                      .read<LibraryBloc>()
                      .add(ResetLibrarySearchRequested());
                }
              },
              animateComponentsOnInit: true,
              searchHint: "Enter the name of an author or book",
              scrollController: scrollController,
              searchBarSlideAnimation:
                  widget.initAnimations?.searchBarInitAnimation,
              searchBarFadeAnimation:
                  widget.initAnimations?.searchBarFadeAnimation,
              welcomeMessageSlideAnimation:
                  widget.initAnimations?.welcomeMessageSlideAnimation,
              welcomeMessageFadeAnimation:
                  widget.initAnimations?.welcomeMessageFadeAnimation,
              expandedHeight: context.appBarExpandedHeight,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => pageSections[index],
                childCount: pageSections.length,
              ),
            ),
          ],
        ),
        BlocBuilder<LibraryBloc, LibraryState>(
          builder: (context, state) {
            final searchInProgress = state is LibrarySearchInProgress;
            final searchResult =
                state is LibraryBooksState ? state.searchResults : <BaseBook>[];
            if (searchInProgress || searchResult.isNotEmpty) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                top: context.appBarExpandedHeight - 20,
                left: 10,
                right: 10,
                child: SizedBox(
                  height: context.screenHeight * .3,
                  width: context.screenWidth,
                  child: Card(
                    elevation: 10,
                    shape: const RoundedRectangleBorder(),
                    color: context.colorScheme.background,
                    child: searchInProgress
                        ? const Center(
                            child: CircularProgressIndicator.adaptive(),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            controller: searchResultsListController,
                            itemCount: searchResult.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                hoverColor: context.colorScheme.surface,
                                tileColor: context.colorScheme.background,
                                onTap: () {
                                  context.goNamed(
                                    "book-details",
                                    params: {"bookId": searchResult[index].id!},
                                  );
                                },
                                leading: ExtendedImage.network(
                                  searchResult[index].info.thumbnailImageLink ??
                                      '',
                                  width: 100,
                                  height: 100,
                                ),
                                title: Text(
                                  searchResult[index].info.title,
                                  style: context.textTheme.titleMedium,
                                ),
                                subtitle: Text(
                                  'by: ${searchResult[index].info.authors.join(', ')}',
                                  style: context.textTheme.bodyMedium,
                                ),
                              );
                            },
                          ),
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}

class _WelcomeMessage extends StatelessWidget {
  const _WelcomeMessage();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Text(
              "Hello, ${state is AuthHasLoggedInUser ? state.currentUser.name ?? 'Mr. x' : ''}",
              textAlign: TextAlign.start,
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colorScheme.onBackground,
                fontFamily: "merriweather",
              ),
            );
          },
        ),
        Text(
          "It's a nice day to read a book."
          "\nWhat kind of books do you have in mind?",
          textAlign: TextAlign.start,
          style: context.textTheme.bodyMedium?.copyWith(
            color:
                context.isDarkMode ? Colors.white60 : const Color(0xFF88898D),
          ),
        ),
      ],
    );
  }
}

class ExplorePageInitAnimations {
  late final Animation<Offset> searchBarInitAnimation;
  late final Animation<double> searchBarFadeAnimation;
  late final Animation<Offset> welcomeMessageSlideAnimation;
  late final Animation<double> welcomeMessageFadeAnimation;
  late final Animation<Offset> sectionSlideAnimation;
  late final Animation<double> sectionFadeAnimation;

  ExplorePageInitAnimations(AnimationController animationController) {
    searchBarInitAnimation = Tween<Offset>(
      begin: const Offset(.6, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.0, 0.55, curve: Curves.easeInOutQuint),
    ));
    searchBarFadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.25, .7, curve: Curves.easeInOutCirc),
    ));
    welcomeMessageSlideAnimation = Tween<Offset>(
      begin: const Offset(0, .25),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.6, .9, curve: Curves.easeInOutCirc),
    ));
    welcomeMessageFadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.6, 1, curve: Curves.easeInOutCirc),
    ));
    sectionSlideAnimation = Tween<Offset>(
      begin: const Offset(.3, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.2, .6, curve: Curves.easeInOutCirc),
    ));
    sectionFadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.2, .8, curve: Curves.easeInOutCirc),
    ));
  }
}
