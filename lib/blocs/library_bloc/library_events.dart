part of 'library_bloc.dart';

abstract class LibraryEvent {
  const LibraryEvent();

  EventFutureStates handle(BaseBookRepository repository, LibraryState state);
}

final class EventFutureStates<T> {
  final FutureOr<LibraryLoadingState>? processingState;
  final FutureOr<LibraryLoadingCompletedState>? beforeSuccessState;
  final FutureResult<T>? resultFuture;
  final LibraryState Function(T) stateIfSuccessResult;
  final LibraryError Function(AppError)? stateIfFailureResult;

  const EventFutureStates({
    this.stateIfFailureResult,
    this.processingState,
    this.beforeSuccessState,
    this.resultFuture,
    required this.stateIfSuccessResult,
  });
}

class FetchRecommendedBooksRequested extends LibraryEvent {
  const FetchRecommendedBooksRequested();

  @override
  EventFutureStates handle(BaseBookRepository repository, LibraryState state) {
    return EventFutureStates<List<BaseBook>>(
      processingState: const LoadingRecommendedBooks(),
      resultFuture: repository.getRecommendedList(),
      stateIfSuccessResult: (books) {
        return state.copyWithBooks(
          explorePageBooks:
              state.books.explorePageBooks.copyWith(recommendedBooks: books),
        );
      },
      stateIfFailureResult: (error) => FailedToLoadRecommendedBooks(error),
    );
  }
}

class FetchMostPopularBooksRequested extends LibraryEvent {
  const FetchMostPopularBooksRequested();

  @override
  EventFutureStates handle(BaseBookRepository repository, LibraryState state) {
    return EventFutureStates<List<BaseBook>>(
      processingState: const LoadingMostPopularBooks(),
      resultFuture: repository.getMostPopularList(),
      stateIfSuccessResult: (books) {
        return state.copyWithBooks(
          explorePageBooks:
              state.books.explorePageBooks.copyWith(mostPopularBooks: books),
        );
      },
      stateIfFailureResult: (error) => FailedToLoadMostPopularBooks(error),
    );
  }
}

class FetchReadingNowBooksRequested extends LibraryEvent {
  const FetchReadingNowBooksRequested(this.userId);
  final int userId;

  @override
  EventFutureStates handle(BaseBookRepository repository, LibraryState state) {
    return EventFutureStates<List<BaseUserBookCollection>>(
      processingState: const LoadingReadingNowBooks(),
      resultFuture: repository
          .getUserBookCollections(userId, [BooksCollection.readingNow]),
      stateIfSuccessResult: (booksCollection) => state.copyWith(
        books: state.books.withAddedToUserBookCollections(booksCollection),
      ),
      stateIfFailureResult: (error) => FailedToLoadReadingNowBooks(error),
    );
  }
}

class FetchFavoriteBooksRequested extends LibraryEvent {
  const FetchFavoriteBooksRequested(this.userId);
  final int userId;

  @override
  EventFutureStates handle(BaseBookRepository repository, LibraryState state) {
    return EventFutureStates<List<BaseUserBookCollection>>(
      processingState: const LoadingFavoriteBooks(),
      resultFuture:
          repository.getUserBookCollections(userId, [BooksCollection.favorite]),
      stateIfSuccessResult: (booksCollection) => state.copyWith(
        books: state.books.withAddedToUserBookCollections(booksCollection),
      ),
      stateIfFailureResult: (error) => FailedToLoadFavoriteBooks(error),
    );
  }
}

class ResetUserBookCollections extends LibraryEvent {
  @override
  EventFutureStates handle(BaseBookRepository repository, LibraryState state) {
    return EventFutureStates(
      stateIfSuccessResult: (_) => state.copyWithBooks(userBookCollections: []),
    );
  }
}

class FetchCompletedReadingBooksRequested extends LibraryEvent {
  const FetchCompletedReadingBooksRequested(this.userId);
  final int userId;

  @override
  EventFutureStates handle(BaseBookRepository repository, LibraryState state) {
    return EventFutureStates<List<BaseUserBookCollection>>(
      processingState: const LoadingCompletedReadingBooks(),
      resultFuture: repository
          .getUserBookCollections(userId, [BooksCollection.completedReading]),
      stateIfSuccessResult: (booksCollection) => state.copyWith(
        books: state.books.withAddedToUserBookCollections(booksCollection),
      ),
      stateIfFailureResult: (error) => FailedToLoadCompletedReadingBooks(error),
    );
  }
}

class AddBookToUserCollectionRequested extends LibraryEvent {
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
  EventFutureStates handle(BaseBookRepository repository, LibraryState state) {
    return EventFutureStates<BaseUserBookCollection>(
      processingState: const AddingBooksToUserCollectionInProgress(),
      resultFuture: repository.addToUserCollections(
        userId: userId,
        book: book,
        isFavorite: isFavorite,
        completionPercent: completionPercent,
      ),
      beforeSuccessState: const AddingBooksToUserCollectionSuccess(),
      stateIfSuccessResult: (bookCollection) =>
          getSuccessState(state, bookCollection),
      stateIfFailureResult: (error) => FailedToAddBooksToUserCollection(error),
    );
  }

  LibraryState getSuccessState(
    LibraryState currentState,
    BaseUserBookCollection bookCollection,
  ) {
    final List<BaseUserBookCollection> userBookCollections =
        List.from(currentState.books.userBookCollections);
    userBookCollections.removeWhere((e) => e.uid == bookCollection.uid);
    userBookCollections.add(bookCollection);
    return currentState.copyWithBooks(userBookCollections: userBookCollections);
  }
}

class LibrarySearchRequested extends LibraryEvent {
  LibrarySearchRequested(this.searchTerm);
  final String searchTerm;

  @override
  EventFutureStates handle(BaseBookRepository repository, LibraryState state) {
    return EventFutureStates<List<BaseBook>>(
      processingState: const LibrarySearchInProgress(),
      resultFuture: repository.searchFor(searchTerm),
      stateIfSuccessResult: (searchResults) =>
          state.copyWith(searchResults: searchResults),
      stateIfFailureResult: (error) => LibrarySearchFailed(error),
    );
  }
}

class ResetLibrarySearchRequested extends LibraryEvent {
  ResetLibrarySearchRequested();

  @override
  EventFutureStates handle(BaseBookRepository repository, LibraryState state) {
    return EventFutureStates(
      stateIfSuccessResult: (_) => state.copyWith(searchResults: []),
    );
  }
}
