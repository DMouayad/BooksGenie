import 'package:books_genie/domain/book/base/entities/base_user_book_collection.dart';
import 'package:books_genie/domain/book/utils/enums/books_collection.dart';
import 'package:books_genie/support/result/result.dart';

import 'entities/base_book.dart';

abstract class BaseBookDataSource<B extends BaseBook,
    C extends BaseUserBookCollection> {
  const BaseBookDataSource();
  FutureResult<B> saveBook(B book);
  FutureResult<B?> getById(String id);
  FutureResult<List<B>> searchFor(String term);

  FutureVoidResult saveUserBookCollection(C userBookCollection);

  /// Returns a list of the books which the user have added to the his collections.
  /// The [collections] property specifies how books will be selected.
  ///
  /// if [collections] is empty, all the books will be returned.
  FutureResult<List<B>> getUserBooks({
    required int userId,
    required List<BooksCollection> collections,
  });
  FutureResult<C?> getUserBookCollection({
    required int userId,
    required String bookId,
  });
  FutureResult<List<C>> getUserBookCollections({
    required int userId,
    required List<BooksCollection> collections,
  });
}
