import 'package:books_genie/domain/book/base/base_book_repository_with_google_books_api.dart';
import 'package:books_genie/domain/book/data/firebase/models/firebase_book.dart';
import 'package:books_genie/domain/book/data/firebase/models/firebase_user_book_collection.dart';
import 'package:books_genie/domain/book/utils/enums/books_collection.dart';
import 'package:books_genie/support/result/result.dart';

import 'firebase_with_google_books_api_book_data_source.dart';

class FirebaseBookRepository extends BaseBookRepositoryWithGoogleBooksApi<
    FirebaseBook, FirebaseUserBookCollection> {
  FirebaseBookRepository()
      : super(const FirebaseWithGoogleBooksApiBookDataSource());

  List<FirebaseBook> _libraryBooks = [];

  @override
  List<FirebaseBook> get libraryBooks => _libraryBooks;
  @override
  set libraryBooks(List<FirebaseBook> value) {
    _libraryBooks = value;
  }

  @override
  FutureResult<FirebaseUserBookCollection> addToUserCollections({
    required int userId,
    required FirebaseBook book,
    bool? isFavorite,
    double? completionPercent,
    bool updateIfExists = true,
  }) async {
    final userBookCollection = FirebaseUserBookCollection(
      userId: userId,
      bookId: book.id,
      completionPercent: completionPercent,
      collections:
          BooksCollection.getCollectionsFor(isFavorite, completionPercent),
    );
    return (await dataSource.saveUserBookCollection(userBookCollection))
        .mapSuccess((_) => userBookCollection);
  }

  @override
  FutureResult<List<FirebaseBook>> searchFor(List<String> terms) {
    // TODO: implement searchFor
    throw UnimplementedError();
  }
}
