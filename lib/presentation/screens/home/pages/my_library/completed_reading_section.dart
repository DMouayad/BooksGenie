import 'package:books_genie/blocs/library_bloc/library_bloc.dart';
import 'package:books_genie/presentation/shared_widgets/library_bloc_books_section.dart';
import 'package:flutter/material.dart';

class CompletedReadingSection extends StatelessWidget {
  const CompletedReadingSection({super.key, required this.userId});
  final int userId;

  @override
  Widget build(BuildContext context) {
    return LibraryBlocBooksSection(
      title: 'COMPLETED READING',
      eventToRequestOnRetry: FetchCompletedReadingBooksRequested(userId),
      buildWhen: (prev, next) {
        return next.loadingState is LoadingCompletedReadingBooks ||
            next.errorState is FailedToLoadCompletedReadingBooks ||
            next.books.userBookCollections != prev.books.userBookCollections;
      },
      showAddButtonOnEmpty: true,
      booksBuilder: (bloc, state) {
        if (state.loadingState is LoadingCompletedReadingBooks) {
          return null;
        }
        return bloc.getUserBooksFrom(state.books.completedReadingBooksIds);
      },
    );
  }
}
