import 'package:books_genie/domain/book/base/entities/base_book.dart';
import 'package:books_genie/domain/book/utils/enums/books_collection.dart';
import 'package:books_genie/support/result/result.dart';

import 'base_book_data_source.dart';
import 'entities/base_user_book_collection.dart';

abstract class BaseBookRepository<B extends BaseBook,
    C extends BaseUserBookCollection> {
  final BaseBookDataSource<B, C> dataSource;

  const BaseBookRepository(this.dataSource);

  List<B> get libraryBooks;

  set libraryBooks(List<B> value);

  FutureResult<List<C>> getUserBookCollections(
      int userId, List<BooksCollection> collections) async {
    return await dataSource.getUserBookCollections(
        userId: userId, collections: collections);
  }

  FutureResult<List<B>> getCompletedReadingCollectionBooks(int userId) async {
    return await addBooksToListOnSuccess(
      dataSource.getUserBooks(
          userId: userId, collections: [BooksCollection.completedReading]),
    );
  }

  FutureResult<List<B>> getFavoriteCollectionBooks(int userId) async {
    return await addBooksToListOnSuccess(dataSource
        .getUserBooks(userId: userId, collections: [BooksCollection.favorite]));
  }

  FutureResult<List<B>> getReadingNowCollectionBooks(int userId) async {
    return await addBooksToListOnSuccess(
      dataSource.getUserBooks(
          userId: userId, collections: [BooksCollection.readingNow]),
    );
  }

  FutureResult<List<B>> getRecommendedList();
  FutureResult<List<B>> getMostPopularList();
  FutureResult<List<B>> searchFor(List<String> terms);

  FutureResult<List<B>> addBooksToListOnSuccess(
      FutureResult<List<B>> booksResult) async {
    return (await booksResult).fold(ifSuccess: (books) {
      libraryBooks.addAll(books);
      libraryBooks = libraryBooks.toSet().toList();
    });
  }

  /// Add the given book to the user book collection(s) based on
  /// [isFavorite] and [completionPercent].
  ///
  /// - The [book] will be stored in the data source if it wasn't already saved.
  /// And a new [BaseUserBookCollection] will be created.
  ///
  /// Returns [FailureResult] in the case of:
  /// - A user with id equal to [userId] was not found.
  /// - [updateIfExists] was set to false and an existing [BaseUserBookCollection]
  /// was found.
  FutureResult<C> addToUserCollections({
    required int userId,
    required B book,
    bool? isFavorite,
    double? completionPercent,
    bool updateIfExists = true,
  });
}
