import 'package:books_finder/books_finder.dart' as google_books;
import 'package:books_genie/domain/book/data/firebase/firebase_book_data_source.dart';
import 'package:books_genie/domain/book/data/firebase/models/firebase_book.dart';
import 'package:books_genie/support/result/result.dart';

class FirebaseWithGoogleBooksApiBookDataSource extends FirebaseBookDataSource {
  const FirebaseWithGoogleBooksApiBookDataSource();

  @override
  FutureResult<List<FirebaseBook>> searchFor(String term) async {
    return await Result.fromAsync(() async {
      final result = await google_books.queryBooks(term);
      return result.map((e) => FirebaseBook.fromGoogleBook(e)).toList();
    });
  }

  @override
  FutureResult<FirebaseBook?> getById(String id) async {
    FirebaseBook resultBook;
    return await Result.fromStream((sink) async {
      // first check if the book exists in the local db
      // and if not fetch it from GoogleBooks API
      await (await super.getById(id)).foldAsync(
        ifFailure: (error) async => sink.addError(error),
        ifSuccess: (book) async {
          if (book == null) {
            final googleBook = await google_books.getSpecificBook(id);
            resultBook = FirebaseBook.fromGoogleBook(googleBook);
            print(
              "Book with id($id) was successfully fetched from GoogleBooks API",
            );
            saveBook(resultBook);
          } else {
            resultBook = book;
            print("Book with id($id) was found in the firestore");
          }

          sink.add(resultBook);
        },
      );
    });
  }
}
