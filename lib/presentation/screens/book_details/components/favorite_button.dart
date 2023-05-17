import 'package:books_genie/blocs/auth_bloc/auth_bloc.dart';
import 'package:books_genie/blocs/library_bloc/library_bloc.dart';
import 'package:books_genie/domain/book/base/entities/base_book.dart';
import 'package:books_genie/presentation/helpers/show_login_required_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton(this.book, {this.style, super.key});
  final BaseBook book;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryBloc, LibraryState>(
      buildWhen: (prev, next) =>
          prev.books.favoriteBooksIds != next.books.favoriteBooksIds,
      builder: (context, state) {
        bool liked = state.books.getBookIsFavorite(book);
        return TextButton.icon(
          style: style,
          onPressed: () => onPressed(context, liked, state),
          icon: Icon(
            liked ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
            color: liked ? Colors.red : null,
          ),
          label: Text(liked ? "Unlike" : "Like"),
        );
      },
    );
  }

  void onPressed(BuildContext context, bool? liked, LibraryState libraryState) {
    final authState = context.read<AuthBloc>().state;
    final newLikedState = !(liked ?? true);

    if (authState is AuthHasLoggedInUser) {
      context.read<LibraryBloc>().add(AddBookToUserCollectionRequested(
          authState.currentUser.id!, book,
          isFavorite: newLikedState,
          completionPercent: libraryState.books
              .getBookUserCollectionInfo(book)
              ?.completionPercent));
    } else {
      showLoginRequiredDialog(
          context,
          ' You need to be logged in '
          'in order to mark a book as favorite.');
    }
  }
}
