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
    return LibraryBlocBooksSection(
      fadeAnimation: fadeAnimation,
      slideAnimation: slideAnimation,
      title: 'Most popular books',
      animate: context.screenHeight > 600,
      eventToRequestOnRetry: const FetchMostPopularBooksRequested(),
      buildWhen: (prev, next) {
        return (next.loadingState is LoadingMostPopularBooks) ||
            (next.errorState is FailedToLoadMostPopularBooks) ||
            (prev.books.explorePageBooks.mostPopularBooks !=
                next.books.explorePageBooks.mostPopularBooks);
      },
      booksBuilder: (bloc, state) {
        if (state.loadingState is LoadingMostPopularBooks) {
          return null;
        }
        return state.books.explorePageBooks.mostPopularBooks;
      },
    );
  }
}
