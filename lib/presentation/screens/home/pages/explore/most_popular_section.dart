import 'package:books_genie/presentation/shared_widgets/library_bloc_books_section.dart';
import 'package:flutter/material.dart';
import 'package:books_genie/blocs/library_bloc/library_bloc.dart';
import 'package:books_genie/support/utils/context_extensions.dart';

class MostPopularSection extends StatelessWidget {
  const MostPopularSection({
    super.key,
    required this.slideAnimation,
    required this.fadeAnimation,
  });
  final Animation<Offset>? slideAnimation;
  final Animation<double>? fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return LibraryBlocBooksSection<FailedToLoadMostPopularBooks>(
      fadeAnimation: fadeAnimation,
      slideAnimation: slideAnimation,
      title: 'Most popular books',
      animate: context.screenHeight > 600,
      eventToRequestOnRetry: const FetchMostPopularBooksRequested(),
      buildWhen: (prev, next) {
        return [FailedToLoadMostPopularBooks, LoadingMostPopularBooks]
                .contains(next.runtimeType) ||
            (next is LibraryBooksState &&
                (prev is LibraryBooksState
                    ? prev.explorePageBooks.mostPopularBooks !=
                        next.explorePageBooks.mostPopularBooks
                    : true));
      },
      booksBuilder: (bloc, state) {
        if (state is LibraryBooksState) {
          return state.explorePageBooks.mostPopularBooks;
        }
        return null;
      },
    );
  }
}
