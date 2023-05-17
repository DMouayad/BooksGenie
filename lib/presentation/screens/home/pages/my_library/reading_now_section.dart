import 'package:books_genie/blocs/library_bloc/library_bloc.dart';
import 'package:books_genie/presentation/shared_widgets/library_bloc_books_section.dart';
import 'package:flutter/material.dart';

class ReadingNowSection extends StatelessWidget {
  const ReadingNowSection({super.key, required this.userId});
  final int userId;
  @override
  Widget build(BuildContext context) {
    return LibraryBlocBooksSection(
      title: 'READING NOW',
      eventToRequestOnRetry: FetchReadingNowBooksRequested(userId),
      buildWhen: (prev, next) {
        return next.loadingState is LoadingReadingNowBooks ||
            next.errorState is FailedToLoadReadingNowBooks ||
            next.books.readingNowBooksIds != prev.books.readingNowBooksIds;
      },
      showAddButtonOnEmpty: true,
      booksBuilder: (bloc, state) {
        if (state.loadingState is LoadingReadingNowBooks) {
          return null;
        }
        return bloc.getUserBooksFrom(state.books.readingNowBooksIds);
      },
    );
  }
}
