import 'package:books_genie/presentation/shared_widgets/library_bloc_books_section.dart';
import 'package:flutter/material.dart';
import 'package:books_genie/blocs/library_bloc/library_bloc.dart';

class RecommendedBooksSection extends StatelessWidget {
  const RecommendedBooksSection({
    super.key,
    required this.slideAnimation,
    required this.fadeAnimation,
  });
  final Animation<Offset>? slideAnimation;
  final Animation<double>? fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return LibraryBlocBooksSection<FailedToLoadRecommendedBooks>(
      fadeAnimation: fadeAnimation,
      slideAnimation: slideAnimation,
      title: 'RECOMMENDED BOOKS',
      eventToRequestOnRetry: const FetchRecommendedBooksRequested(),
      buildWhen: (prev, next) {
        return [FailedToLoadRecommendedBooks, LoadingRecommendedBooks]
                .contains(next.runtimeType) ||
            (next is LibraryBooksState &&
                (prev is LibraryBooksState
                    ? prev.explorePageBooks.recommendedBooks !=
                        next.explorePageBooks.recommendedBooks
                    : true));
      },
      booksBuilder: (bloc, state) {
        if (state is LibraryBooksState) {
          return state.explorePageBooks.recommendedBooks;
        }
        return null;
      },
    );
  }
}
