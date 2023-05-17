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
    return LibraryBlocBooksSection(
      fadeAnimation: fadeAnimation,
      slideAnimation: slideAnimation,
      title: 'RECOMMENDED BOOKS',
      eventToRequestOnRetry: const FetchRecommendedBooksRequested(),
      buildWhen: (prev, next) {
        return (next.loadingState is LoadingRecommendedBooks) ||
            (next.errorState is FailedToLoadRecommendedBooks) ||
            (prev.books.explorePageBooks.recommendedBooks !=
                next.books.explorePageBooks.recommendedBooks);
      },
      booksBuilder: (bloc, state) {
        if (state.loadingState is LoadingRecommendedBooks) {
          return null;
        }
        return state.books.explorePageBooks.recommendedBooks;
      },
    );
  }
}
