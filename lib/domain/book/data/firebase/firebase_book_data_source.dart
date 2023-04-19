import 'package:books_genie/domain/book/base/base_book_data_source.dart';
import 'package:books_genie/domain/book/data/firebase/models/firebase_book.dart';
import 'package:books_genie/domain/book/data/firebase/models/firebase_user_book_collection.dart';
import 'package:books_genie/domain/book/utils/enums/books_collection.dart';
import 'package:books_genie/support/result/result.dart';
import 'package:books_genie/support/utils/extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseBookDataSource
    extends BaseBookDataSource<FirebaseBook, FirebaseUserBookCollection> {
  const FirebaseBookDataSource();
  CollectionReference<FirebaseBook> get _books {
    return FirebaseFirestore.instance.collection('books').withConverter(
          fromFirestore: FirebaseBook.fromFirestore,
          toFirestore: (FirebaseBook book, options) => book.toFirestore(),
        );
  }

  CollectionReference<FirebaseUserBookCollection> get _userBookCollection {
    return FirebaseFirestore.instance
        .collection('user_book_collections')
        .withConverter(
          fromFirestore: FirebaseUserBookCollection.fromFirestore,
          toFirestore: (FirebaseUserBookCollection model, _) =>
              model.toFirestore(),
        );
  }

  @override
  FutureResult<FirebaseBook?> getByGoogleBooksId(String id) async {
    return await _handleDocRequest(_books.doc(id));
  }

  FutureResult<T?> _handleDocRequest<T>(DocumentReference<T> toRequest) async {
    final result = await Result.fromStream<T?, AppError>((sink) async {
      toRequest.get().then(
            (docSnap) => sink.add(docSnap.data()),
            onError: (error) => sink.addError(error),
          );
    });
    return result;
  }

  FutureResult<List<T>> _handleQueryRequest<T>(Query<T> toRequest) async {
    return await Result.fromStream<List<T>, AppError>((sink) async {
      toRequest.get().then(
            (docSnap) => sink.add(docSnap.docs.map((e) => e.data()).toList()),
            onError: (error) => sink.addError(error),
          );
    });
  }

  @override
  FutureResult<FirebaseUserBookCollection?> getUserBookCollection({
    required int userId,
    required String bookId,
  }) async {
    return _handleQueryRequest(_userBookCollection
            .where('userId', isEqualTo: userId)
            .where('bookId', isEqualTo: bookId))
        .then((result) => result.mapSuccess((books) => books.first));
  }

  @override
  FutureResult<List<FirebaseBook>> getUserBooks({
    required int userId,
    required List<BooksCollection> collections,
  }) async {
    return await Result.fromStream((sink) async {
      List<int?> userBooksIds = await _getUserBooksIds(userId, collections);

      if (userBooksIds.isEmpty) {
        sink.add([]);
      }
      _handleQueryRequest(_books
              .where('userId', isEqualTo: userId)
              .where('bookId', whereIn: userBooksIds))
          .then((result) => sink.fromResult(result));
    });
  }

  Future<List<int>> _getUserBooksIds(
    int userId,
    List<BooksCollection> collections,
  ) async {
    return await getUserBookCollections(
            userId: userId, collections: collections)
        .then((result) {
      return result.mapTo(
          onFailure: (error) => throw error,
          onSuccess: (books) {
            return books.isNotEmpty
                ? books.map((e) => e.bookId).toList().cast()
                : [];
          });
    });
  }

  @override
  FutureResult<FirebaseBook> saveBook(FirebaseBook book) async {
    return await Result.fromAsync(() async {
      await _books.doc(book.googleBookId).set(book);
      return book;
    });
  }

  @override
  FutureVoidResult saveUserBookCollection(
    FirebaseUserBookCollection userBookCollection,
  ) async {
    return await Result.fromAsync(() async {
      await _userBookCollection
          .doc(userBookCollection.uid)
          .set(userBookCollection);
      return const VoidValue();
    });
  }

  @override
  FutureResult<List<FirebaseBook>> searchFor(List<String> terms) {
    // TODO: implement searchFor
    throw UnimplementedError();
  }

  @override
  FutureResult<List<FirebaseUserBookCollection>> getUserBookCollections({
    required int userId,
    required List<BooksCollection> collections,
  }) async {
    return await _handleQueryRequest(
      _userBookCollection
          .where('userId', isEqualTo: userId)
          .where('collections', isEqualTo: collections.map((e) => e.name)),
    );
  }
}
