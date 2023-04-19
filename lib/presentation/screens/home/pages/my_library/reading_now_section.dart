import 'package:books_genie/blocs/library_bloc/library_bloc.dart';
import 'package:books_genie/presentation/shared_widgets/library_bloc_books_section.dart';
import 'package:flutter/material.dart';

class ReadingNowSection extends StatelessWidget {
  const ReadingNowSection({super.key, required this.userId});
  final int userId;
  @override
  Widget build(BuildContext context) {
    return LibraryBlocBooksSection<FailedToLoadReadingNowBooks>(
      title: 'READING NOW',
      eventToRequestOnRetry: FetchReadingNowBooksRequested(userId),
      buildWhen: (prev, next) {
        return [
          FailedToLoadReadingNowBooks,
          LoadingReadingNowBooks,
          LibraryBooksState
        ].contains(next.runtimeType);
      },
      showAddButtonOnEmpty: true,
      booksBuilder: (bloc, state) {
        if (state is LibraryBooksState) {
          return bloc.getUserBooksFrom(state.readingNowBooksIds);
        }
        return null;
      },
    );
  }
}
