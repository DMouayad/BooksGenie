import 'package:books_genie/domain/book/base/base_book_repository.dart';
import 'package:books_genie/domain/book/base/entities/base_book.dart';
import 'package:books_genie/domain/book/base/entities/base_user_book_collection.dart';
import 'package:books_genie/domain/book/utils/enums/books_collection.dart';
import 'package:books_genie/support/result/result.dart';
import 'package:books_genie/support/services/logger_service.dart';
import 'package:books_genie/support/utils/extensions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_genie/blocs/base_event.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'library_event.dart';
part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final BaseBookRepository _repository;
  LibraryBloc(this._repository) : super(const LibraryInitial()) {
    on<LibraryEvent>(
      (event, emit) => event.handle(_repository, state, emit),
      transformer: sequential(),
    );
  }
  @override
  void onTransition(Transition<LibraryEvent, LibraryState> transition) {
    Log.logBlocTransition(this, transition);
    super.onTransition(transition);
  }

  List<BaseBook> getBooksList() {
    return _repository.libraryBooks;
  }

  BaseBook? getBook(String bookId) {
    return _repository.libraryBooks.firstWhereOrNull((e) => e.id == bookId);
  }

  List<BaseBook> getUserBooksFrom(List<String?> booksIds) {
    return _repository.libraryBooks
        .where((e) => booksIds.contains(e.id))
        .toList();
  }
}
