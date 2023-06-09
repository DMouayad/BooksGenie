import 'package:books_finder/books_finder.dart' as google_books;
import 'package:books_genie/domain/book/data/isar/isar_book_data_source.dart';
import 'package:books_genie/support/result/result.dart';
import 'models/book_model.dart';

class IsarWithGoogleBooksApiBookDataSource extends IsarBookDataSource {
  const IsarWithGoogleBooksApiBookDataSource();

  @override
  FutureResult<List<BookModel>> searchFor(String term) async {
    return await Result.fromAsync(() async {
      final result = await google_books.queryBooks(term);
      return result.map((e) => BookModel.fromGoogleBook(e)).toList();
    });
  }

  @override
  FutureResult<BookModel?> getById(String id) async {
    BookModel resultBook;
    return await Result.fromStream((sink) async {
      // first check if the book exists in the local db
      // and if not fetch it from GoogleBooks API
      await (await super.getById(id)).foldAsync(
        ifSuccess: (book) async {
          if (book == null) {
            final googleBook = await google_books.getSpecificBook(id);
            resultBook = BookModel.fromGoogleBook(googleBook);
            print(
              "Book with id($id) was successfully fetched from GoogleBooks API",
            );
            saveBook(resultBook);
          } else {
            resultBook = book;
            print("Book with id($id) was found in local db");
          }

          sink.add(resultBook);
        },
      );
    });
  }
}
