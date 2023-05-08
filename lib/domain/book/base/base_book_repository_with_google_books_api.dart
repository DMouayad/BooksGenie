import 'package:books_genie/domain/book/base/base_book_repository.dart';
import 'package:books_genie/domain/book/base/entities/base_book.dart';
import 'package:books_genie/support/constants/books_ids.dart';
import 'package:books_genie/support/result/result.dart';

import 'entities/base_user_book_collection.dart';

abstract class BaseBookRepositoryWithGoogleBooksApi<B extends BaseBook,
    C extends BaseUserBookCollection> extends BaseBookRepository<B, C> {
  const BaseBookRepositoryWithGoogleBooksApi(super.dataSource);

  @override
  FutureResult<List<B>> getRecommendedList() async {
    return await addBooksToListOnSuccess(
        _getBooksByGoogleBooksApiBookId(BookIds.recommendedBooksIds));
  }

  @override
  FutureResult<List<B>> getMostPopularList() async {
    return await addBooksToListOnSuccess(
        _getBooksByGoogleBooksApiBookId(BookIds.mostPopularBooksIds));
  }

  FutureResult<List<B>> _getBooksByGoogleBooksApiBookId(
      List<String> booksIds) async {
    return await Result.fromStream((sink) async {
      List<B> books = [];

      for (String id in booksIds) {
        // first check if the book already exists in cache
        if (libraryBooks.where((e) => e.id == id).isNotEmpty) {
          books.add(libraryBooks.where((e) => e.id == id).first);
        } else {
          (await dataSource.getById(id)).fold(
            ifSuccess: (book) {
              if (book != null) books.add(book);
            },
          );
        }
      }
      if (books.isEmpty && booksIds.isNotEmpty) {
        sink.addError(AppError(appException: AppException.failedLoadingBooks));
      }
      sink.add(books);
    });
  }
}
