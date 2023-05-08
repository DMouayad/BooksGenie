import 'package:books_genie/domain/book/base/base_book_repository_with_google_books_api.dart';
import 'package:books_genie/domain/book/data/isar/models/isar_user_book_collection.dart';
import 'package:books_genie/domain/book/utils/enums/books_collection.dart';
import 'package:books_genie/support/utils/extensions.dart';
import 'package:get_it/get_it.dart';
import 'package:books_genie/domain/book/data/isar/isar_book_data_source.dart';
import 'package:books_genie/domain/book/data/isar/models/book_model.dart';
import 'package:books_genie/support/result/result.dart';

class IsarBookRepository extends BaseBookRepositoryWithGoogleBooksApi<BookModel,
    IsarUserBookCollection> {
  IsarBookRepository() : super(GetIt.instance.get<IsarBookDataSource>());

  List<BookModel> _libraryBooks = [];

  @override
  List<BookModel> get libraryBooks => _libraryBooks;
  @override
  set libraryBooks(List<BookModel> value) {
    _libraryBooks = value;
  }

  @override
  FutureResult<List<BookModel>> searchFor(String term) async {
    return (await dataSource.searchFor(term))
        .fold(ifSuccess: (result) => _libraryBooks.addAll(result));
  }

  @override
  FutureResult<IsarUserBookCollection> addToUserCollections({
    required int userId,
    required BookModel book,
    bool? isFavorite,
    double? completionPercent,
    bool updateIfExists = true,
  }) async {
    return await Result.fromStream((sink) async {
      if (book.id == null) {
        (await dataSource.saveBook(book)).fold(
          ifSuccess: (result) => book = result,
          ifFailure: (error) => sink.addError(error),
        );
      }
      IsarUserBookCollection? userBookCollection;
      dataSource
          .getUserBookCollection(userId: userId, bookId: book.id!.toString())
          .foldThen((value) {
        if (value != null) {
          if (!updateIfExists) sink.addError(AppError());

          userBookCollection =
              _updateUserBookCollection(value, isFavorite, completionPercent);
        } else {
          userBookCollection = IsarUserBookCollection(
            userId: userId,
            bookId: book.id.toString(),
            completionPercent: completionPercent,
            collections: BooksCollection.getCollectionsFor(
                isFavorite, completionPercent),
          );
        }

        return dataSource.saveUserBookCollection(userBookCollection!);
      }).then((result) =>
              sink.fromResult(result.mapSuccess((_) => userBookCollection!)));
    });
  }

  IsarUserBookCollection _updateUserBookCollection(
    IsarUserBookCollection instance,
    bool? isFavorite,
    double? completionPercent,
  ) {
    return instance
      ..completionPercent = completionPercent
      ..collections =
          BooksCollection.getCollectionsFor(isFavorite, completionPercent)
              .toSet()
              .toList();
  }
}
