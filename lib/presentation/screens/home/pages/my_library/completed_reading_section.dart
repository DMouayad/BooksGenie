import 'package:books_genie/blocs/library_bloc/library_bloc.dart';
import 'package:books_genie/presentation/shared_widgets/library_bloc_books_section.dart';
import 'package:flutter/material.dart';

class CompletedReadingSection extends StatelessWidget {
  const CompletedReadingSection({super.key, required this.userId});
  final int userId;

  @override
  Widget build(BuildContext context) {
    return LibraryBlocBooksSection<FailedToLoadCompletedReadingBooks>(
      title: 'COMPLETED READING',
      eventToRequestOnRetry: FetchCompletedReadingBooksRequested(userId),
      buildWhen: (prev, next) {
        return [
          FailedToLoadCompletedReadingBooks,
          LoadingCompletedReadingBooks,
          LibraryBooksState
        ].contains(next.runtimeType);
      },
      showAddButtonOnEmpty: true,
      booksBuilder: (bloc, state) {
        if (state is LibraryBooksState) {
          return bloc.getUserBooksFrom(state.completedReadingBooksIds);
        }
        return null;
      },
    );
  }
}
