import 'package:books_genie/blocs/library_bloc/library_bloc.dart';
import 'package:books_genie/support/error/app_error.dart';
import 'package:books_genie/support/utils/context_extensions.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BooksSearchResultsCard extends StatelessWidget {
  final ScrollController scrollController;

  const BooksSearchResultsCard({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LibraryBloc, LibraryState>(
      builder: (context, state) {
        final searchInProgress = state.loadingState is LibrarySearchInProgress;
        final searchResult = state.searchResults;
        final AppError? searchError = state.errorState is LibrarySearchFailed
            ? (state.errorState as LibrarySearchFailed).error
            : null;
        if (searchInProgress || searchResult.isNotEmpty) {
          return SizedBox(
            height: context.screenHeight * .3,
            width: context.screenWidth,
            child: Card(
              elevation: 10,
              shape: const RoundedRectangleBorder(),
              color: context.isDarkMode
                  ? context.colorScheme.primaryContainer
                  : context.colorScheme.background,
              child: () {
                if (searchError != null) {
                  return Center(
                    child: ListTile(
                      leading:
                          Icon(Icons.error, color: Colors.redAccent.shade200),
                      title: Text(
                        'Search Failed',
                        style: context.textTheme.titleMedium?.copyWith(
                          color: Colors.red.shade200,
                        ),
                      ),
                      subtitle: Text(
                        searchError.appException?.message ??
                            searchError.message ??
                            '',
                        style: context.textTheme.bodyLarge?.copyWith(),
                      ),
                    ),
                  );
                }
                if (searchInProgress) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  controller: scrollController,
                  itemCount: searchResult.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      hoverColor: context.colorScheme.secondary.withOpacity(.4),
                      tileColor: context.isDarkMode
                          ? context.colorScheme.primaryContainer
                          : context.colorScheme.background,
                      onTap: () {
                        context.goNamed(
                          "book-details",
                          pathParameters: {"bookId": searchResult[index].id!},
                        );
                      },
                      leading: ExtendedImage.network(
                        searchResult[index].info.thumbnailImageLink ?? '',
                        width: 100,
                        height: 100,
                      ),
                      title: Text(
                        searchResult[index].info.title,
                        style: context.textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        'by: ${searchResult[index].info.authors.join(', ')}',
                        style: context.textTheme.bodyMedium,
                      ),
                    );
                  },
                );
              }(),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
