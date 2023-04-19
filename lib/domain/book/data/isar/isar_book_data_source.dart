import 'package:books_genie/domain/book/data/isar/models/book_info_model.dart';
import 'package:books_genie/domain/book/data/isar/models/isar_user_book_collection.dart';
import 'package:books_genie/domain/book/utils/enums/books_collection.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:books_genie/support/result/result.dart';
import '../../base/base_book_data_source.dart';
import 'models/book_model.dart';

class IsarBookDataSource
    extends BaseBookDataSource<BookModel, IsarUserBookCollection> {
  const IsarBookDataSource();
  Isar get _isarDB => GetIt.instance.get<Isar>();

  @override
  Future<Result<BookModel?, AppError>> getByGoogleBooksId(String id) async {
    return SuccessResult(
      await _isarDB.bookModels.where().googleBookIdEqualTo(id).findFirst(),
    );
  }

  @override
  FutureResult<List<BookModel>> searchFor(List<String> terms) async {
    return await Result.fromStream((sink) async {
      final result = await _isarDB.bookModels
          .filter()
          .anyOf(
            terms,
            (bookQuery, String term) => bookQuery.info(
              (q) => q.anyOf(
                  [term],
                  (infoQuery, String term) => infoQuery
                      .titleContains(term)
                      .or()
                      .authorsElementContains(term)),
            ),
          )
          .findAll();
      sink.add(result);
    });
  }

  @override
  FutureResult<List<BookModel>> getUserBooks({
    required int userId,
    required List<BooksCollection> collections,
  }) async {
    try {
      final userBooksIds = await getUserBooksIds(userId, collections);
      if (userBooksIds.isEmpty) {
        return const SuccessResult([]);
      }

      final books = await _isarDB.bookModels
          .filter()
          .anyOf(userBooksIds, (q, String id) => q.isarIdEqualTo(int.parse(id)))
          .findAll();
      return SuccessResult(books);
    } on Exception catch (e) {
      return FailureResult.withException(e);
    }
  }

  Future<List<String>> getUserBooksIds(
    int userId,
    List<BooksCollection> collections,
  ) async {
    final list = await _isarDB.isarUserBookCollections
        .filter()
        .userIdEqualTo(userId)
        .and()
        .allOf(collections, (q, value) => q.collectionsElementEqualTo(value))
        .and()
        .bookIdIsNotNull()
        .bookIdProperty()
        .findAll();
    return list.isNotEmpty ? list.cast() : [];
  }

  @override
  FutureResult<BookModel> saveBook(BookModel book) async {
    return await Result.fromAsync(() async {
      return await _isarDB.writeTxn(() async {
        await _isarDB.bookModels.put(book);
        return book;
      });
    });
  }

  FutureVoidResult saveBooks(List<BookModel> books) async {
    return await Result.fromAsync(() async {
      return await _isarDB.writeTxn(() async {
        await _isarDB.bookModels.putAll(books);
        return const VoidValue();
      });
    });
  }

  @override
  FutureResult<IsarUserBookCollection?> getUserBookCollection({
    required int userId,
    required String bookId,
  }) async {
    return await Result.fromStream((sink) async {
      _isarDB.isarUserBookCollections
          .filter()
          .userIdEqualTo(userId)
          .and()
          .bookIdEqualTo(bookId)
          .findFirst()
          .then((value) => sink.add(value));
    });
  }

  @override
  FutureVoidResult saveUserBookCollection(
    IsarUserBookCollection userBookCollection,
  ) async {
    return await Result.fromAsync(() async {
      return await _isarDB.writeTxn(() async {
        await _isarDB.isarUserBookCollections.put(userBookCollection);
        return const VoidValue();
      });
    });
  }

  @override
  FutureResult<List<IsarUserBookCollection>> getUserBookCollections({
    required int userId,
    required List<BooksCollection> collections,
  }) async {
    return Result.fromAsync(() async {
      return await _isarDB.isarUserBookCollections
          .filter()
          .userIdEqualTo(userId)
          .and()
          .allOf(collections, (q, value) => q.collectionsElementEqualTo(value))
          .and()
          .bookIdIsNotNull()
          .findAll();
    });
  }
}
