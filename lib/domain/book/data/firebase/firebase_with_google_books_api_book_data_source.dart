import 'package:books_finder/books_finder.dart';
import 'package:books_genie/domain/book/data/firebase/firebase_book_data_source.dart';
import 'package:books_genie/domain/book/data/firebase/models/firebase_book.dart';
import 'package:books_genie/support/result/result.dart';

class FirebaseWithGoogleBooksApiBookDataSource extends FirebaseBookDataSource {
  const FirebaseWithGoogleBooksApiBookDataSource();
  @override
  FutureResult<FirebaseBook?> getByGoogleBooksId(String id) async {
    FirebaseBook resultBook;
    return await Result.fromStream((sink) async {
      // first check if the book exists in the local db
      // and if not fetch it from GoogleBooks API
      await (await super.getByGoogleBooksId(id)).foldAsync(
        ifFailure: (error) async => sink.addError(error),
        ifSuccess: (book) async {
          if (book == null) {
            final googleBook = await getSpecificBook(id);
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
