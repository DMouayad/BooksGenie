import 'package:books_genie/blocs/library_bloc/library_bloc.dart';
import 'package:books_genie/presentation/shared_widgets/library_bloc_books_section.dart';
import 'package:flutter/material.dart';

class FavoriteBooksSection extends StatelessWidget {
  const FavoriteBooksSection({super.key, required this.userId});
  final int userId;

  @override
  Widget build(BuildContext context) {
    return LibraryBlocBooksSection<FailedToLoadFavoriteBooks>(
      title: 'My Favorites',
      eventToRequestOnRetry: FetchFavoriteBooksRequested(userId),
      buildWhen: (prev, next) {
        return [
          FailedToLoadFavoriteBooks,
          LoadingFavoriteBooks,
          LibraryBooksState
        ].contains(next.runtimeType);
      },
      showAddButtonOnEmpty: true,
      booksBuilder: (bloc, state) {
        if (state is LibraryBooksState) {
          return bloc.getUserBooksFrom(state.favoriteBooksIds);
        }
        return null;
      },
    );
  }
}
