part of 'library_bloc.dart';

abstract class LibraryEvent
    extends BaseBlocEvent<BaseBookRepository, LibraryState> {
  const LibraryEvent();
}

class FetchRecommendedBooksRequested extends LibraryEvent {
  const FetchRecommendedBooksRequested();

  @override
  Future<void> handle(
    BaseBookRepository repository,
    LibraryState state,
    Emitter<LibraryState> emit,
  ) async {
    if (state is! LoadingRecommendedBooks) {
      emit(const LoadingRecommendedBooks());
      emit((await repository.getRecommendedList()).mapTo(
        onSuccess: (books) => state is LibraryBooksState
            ? state.copyWith(
                explorePageBooks:
                    state.explorePageBooks.copyWith(recommendedBooks: books))
            : LibraryBooksState(
                explorePageBooks: ExplorePageBooks(recommendedBooks: books)),
        onFailure: (error) => FailedToLoadRecommendedBooks(error),
      ));
    }
  }
}

class FetchMostPopularBooksRequested extends LibraryEvent {
  const FetchMostPopularBooksRequested();

  @override
  Future<void> handle(
    BaseBookRepository repository,
    LibraryState state,
    Emitter<LibraryState> emit,
  ) async {
    if (state is! LoadingMostPopularBooks) {
      emit(const LoadingMostPopularBooks());
      emit((await repository.getMostPopularList()).mapTo(
        onSuccess: (books) {
          return state is LibraryBooksState
              ? state.copyWith(
                  explorePageBooks:
                      state.explorePageBooks.copyWith(mostPopularBooks: books))
              : LibraryBooksState(
                  explorePageBooks: ExplorePageBooks(mostPopularBooks: books));
        },
        onFailure: (error) => FailedToLoadMostPopularBooks(error),
      ));
    }
  }
}

class FetchReadingNowBooksRequested extends LibraryEvent {
  const FetchReadingNowBooksRequested(this.userId);
  final int userId;

  @override
  Future<void> handle(
    BaseBookRepository repository,
    LibraryState state,
    Emitter<LibraryState> emit,
  ) async {
    if (state is! LoadingReadingNowBooks) {
      emit(const LoadingReadingNowBooks());
      emit((await repository.getUserBookCollections(
        userId,
        [BooksCollection.readingNow],
      ))
          .mapTo(
        onSuccess: (booksCollection) {
          return state is LibraryBooksState
              ? state.withAddedToUserBookCollections(booksCollection)
              : LibraryBooksState(userBookCollections: booksCollection);
        },
        onFailure: (error) => FailedToLoadReadingNowBooks(error),
      ));
    }
  }
}

class FetchFavoriteBooksRequested extends LibraryEvent {
  const FetchFavoriteBooksRequested(this.userId);
  final int userId;

  @override
  Future<void> handle(
    BaseBookRepository repository,
    LibraryState state,
    Emitter<LibraryState> emit,
  ) async {
    if (state is! LoadingFavoriteBooks) {
      emit(const LoadingFavoriteBooks());
      emit((await repository.getUserBookCollections(
        userId,
        [BooksCollection.favorite],
      ))
          .mapTo(
        onSuccess: (booksCollection) {
          return state is LibraryBooksState
              ? state.withAddedToUserBookCollections(booksCollection)
              : LibraryBooksState(userBookCollections: booksCollection);
        },
        onFailure: (error) => FailedToLoadFavoriteBooks(error),
      ));
    }
  }
}

class ResetUserBookCollections extends LibraryEvent {
  @override
  Future<void> handle(
    BaseBookRepository repository,
    LibraryState state,
    Emitter<LibraryState> emit,
  ) async {
    emit(state is LibraryBooksState
        ? state.copyWith(userBookCollections: [])
        : const LibraryBooksState());
  }
}

class FetchCompletedReadingBooksRequested extends LibraryEvent {
  const FetchCompletedReadingBooksRequested(this.userId);
  final int userId;

  @override
  Future<void> handle(
    BaseBookRepository repository,
    LibraryState state,
    Emitter<LibraryState> emit,
  ) async {
    if (state is! LoadingCompletedReadingBooks) {
      emit(const LoadingCompletedReadingBooks());
      emit((await repository.getUserBookCollections(
        userId,
        [BooksCollection.completedReading],
      ))
          .mapTo(
        onSuccess: (booksCollection) {
          return state is LibraryBooksState
              ? state.withAddedToUserBookCollections(booksCollection)
              : LibraryBooksState(userBookCollections: booksCollection);
        },
        onFailure: (error) => FailedToLoadCompletedReadingBooks(error),
      ));
    }
  }
}

class AddBookToUserCollectionRequested extends LibraryEvent
    with _AddingNewBooksHelper {
  AddBookToUserCollectionRequested(
    this.userId,
    this.book, {
    this.isFavorite,
    this.completionPercent,
  });

  final int userId;
  final BaseBook book;
  final bool? isFavorite;
  final double? completionPercent;

  @override
  Future<void> handle(
    BaseBookRepository repository,
    LibraryState state,
    Emitter<LibraryState> emit,
  ) async {
    if (state is! AddingBooksToUserCollectionInProgress) {
      emit(const AddingBooksToUserCollectionInProgress());
      await (await repository.addToUserCollections(
        userId: userId,
        book: book,
        isFavorite: isFavorite,
        completionPercent: completionPercent,
      ))
          .foldAsync(
        ifSuccess: (bookCollection) async {
          emit(const AddingBooksToUserCollectionSuccess());
          await Future.delayed(const Duration(milliseconds: 200), () {
            emit(getSuccessState(state, bookCollection));
          });
        },
        ifFailure: (error) async =>
            emit(FailedToAddBooksToUserCollection(error)),
      );
    }
  }
}

mixin _AddingNewBooksHelper {
  LibraryBooksState getSuccessState(
    LibraryState currentState,
    BaseUserBookCollection bookCollection,
  ) {
    late List<BaseUserBookCollection> userBookCollections;
    if (currentState is LibraryBooksState) {
      userBookCollections =
          List<BaseUserBookCollection>.from(currentState.userBookCollections);
      userBookCollections.removeWhere((e) => e.uid == bookCollection.uid);
      userBookCollections.add(bookCollection);
      return currentState.copyWith(userBookCollections: userBookCollections);
    } else {
      userBookCollections = [bookCollection];
      return LibraryBooksState(userBookCollections: userBookCollections);
    }
  }
}
