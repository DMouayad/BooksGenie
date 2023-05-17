import 'package:books_genie/blocs/library_bloc/library_bloc.dart';
import 'package:books_genie/domain/book/base/entities/base_book.dart';
import 'package:books_genie/presentation/screens/home/pages/explore/books_swipe_list.dart';
import 'package:books_genie/presentation/shared_widgets/page_section.dart';
import 'package:books_genie/support/utils/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'error_list_tile.dart';

class LibraryBlocBooksSection extends StatelessWidget {
  final Animation<Offset>? slideAnimation;
  final Animation<double>? fadeAnimation;
  final String title;
  final bool animate;
  final bool Function(LibraryState previous, LibraryState current) buildWhen;
  final List<BaseBook>? Function(LibraryBloc bloc, LibraryState state)
      booksBuilder;
  final LibraryEvent eventToRequestOnRetry;
  final bool showAddButtonOnEmpty;
  final void Function(List<BaseBook> books)? onAddBooksToList;

  const LibraryBlocBooksSection({
    super.key,
    this.slideAnimation,
    this.fadeAnimation,
    this.showAddButtonOnEmpty = false,
    this.onAddBooksToList,
    this.animate = true,
    required this.title,
    required this.buildWhen,
    required this.booksBuilder,
    required this.eventToRequestOnRetry,
  });
  @override
  Widget build(BuildContext context) {
    return PageSection(
      fadeAnimation: fadeAnimation,
      slideAnimation: slideAnimation,
      animate: animate,
      title: title,
      body: BlocBuilder<LibraryBloc, LibraryState>(
        buildWhen: buildWhen,
        builder: ((context, state) {
          final books = booksBuilder(context.read(), state);
          if (books != null) {
            if (books.isEmpty && showAddButtonOnEmpty) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: context.colorScheme.primaryContainer,
                  title: Text(
                    "This list is empty!",
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.onBackground,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            }
            return BooksSwipeList(
              books: books.take(15).toList(),
            );
          }
          if (state.errorState != null) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: SizedBox(
                height: 70,
                child: ErrorListTile(
                  title: "Loading failed!",
                  error: state.errorState!.error,
                  onRetry: () =>
                      context.read<LibraryBloc>().add(eventToRequestOnRetry),
                ),
              ),
            );
          }
          return const SizedBox(
            height: 70,
            child: Center(child: CircularProgressIndicator.adaptive()),
          );
        }),
      ),
    );
  }
}
