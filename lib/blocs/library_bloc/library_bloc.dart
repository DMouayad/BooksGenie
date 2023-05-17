import 'dart:async';

import 'package:books_genie/domain/book/base/base_book_repository.dart';
import 'package:books_genie/domain/book/base/entities/base_book.dart';
import 'package:books_genie/domain/book/base/entities/base_user_book_collection.dart';
import 'package:books_genie/domain/book/utils/enums/books_collection.dart';
import 'package:books_genie/support/result/result.dart';
import 'package:books_genie/support/services/logger_service.dart';
import 'package:books_genie/support/utils/extensions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'library_events.dart';
part 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final BaseBookRepository _repository;

  LibraryBloc(this._repository) : super(const LibraryState()) {
    on<LibraryEvent>(
      (event, emit) async {
        final states = event.handle(_repository, state);

        if (states.processingState != null) {
          emit(state.copyWith(loadingState: await states.processingState));
        }
        if (states.resultFuture != null) {
          (await states.resultFuture)!.fold(
            ifSuccess: (value) async {
              if (states.beforeSuccessState != null) {
                emit(state.copyWith(
                    loadingCompletedState: await states.beforeSuccessState));
              }
              await Future.delayed(const Duration(milliseconds: 200));
              emit(states
                  .stateIfSuccessResult(value)
                  .copyWith(loadingState: null, loadingCompletedState: null));
            },
            ifFailure: (error) {
              if (states.stateIfFailureResult != null) {
                emit(state.copyWith(
                  errorState: states.stateIfFailureResult!(error),
                  loadingState: null,
                  loadingCompletedState: null,
                ));
              }
            },
          );
        } else {
          emit(states.stateIfSuccessResult(null));
        }
      },
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
