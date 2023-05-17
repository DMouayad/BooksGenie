part of 'library_bloc.dart';

class LibraryState extends Equatable {
  final LibraryBooks books;
  final LibraryError? errorState;
  final LibraryLoadingState? loadingState;
  final LibraryLoadingCompletedState? loadingCompletedState;
  final List<BaseBook> searchResults;

  @override
  List<Object?> get props =>
      [books, errorState, loadingState, loadingCompletedState, searchResults];

  const LibraryState({
    this.books = const LibraryBooks(),
    this.errorState,
    this.loadingState,
    this.loadingCompletedState,
    this.searchResults = const [],
  });

  LibraryState copyWithBooks({
    List<BaseUserBookCollection>? userBookCollections,
    ExplorePageBooks? explorePageBooks,
  }) {
    return LibraryState(
      errorState: errorState,
      loadingState: loadingState,
      books: books.copyWith(
        userBookCollections: userBookCollections,
        explorePageBooks: explorePageBooks,
      ),
    );
  }

  LibraryState copyWith({
    LibraryBooks? books,
    LibraryError? errorState,
    LibraryLoadingState? loadingState,
    LibraryLoadingCompletedState? loadingCompletedState,
    List<BaseBook>? searchResults,
  }) {
    return LibraryState(
      books: books ?? this.books,
      errorState: errorState ?? this.errorState,
      loadingState: loadingState ?? this.loadingState,
      loadingCompletedState:
          loadingCompletedState ?? this.loadingCompletedState,
      searchResults: searchResults ?? this.searchResults,
    );
  }

  @override
  String toString() {
    return '''$runtimeType: (
    books: $books,
    error state: $errorState,
    loading state: $loadingState,
    )''';
  }
}

class LibraryBooks extends Equatable {
  const LibraryBooks({
    this.userBookCollections = const [],
    this.explorePageBooks = const ExplorePageBooks(),
  });

  final List<BaseUserBookCollection> userBookCollections;
  final ExplorePageBooks explorePageBooks;

  bool getBookIsFavorite(BaseBook book) {
    return favoriteBooksIds.contains(book.id);
  }

  bool getIsReadingBook(BaseBook book) {
    return readingNowBooksIds.contains(book.id);
  }

  List<String?> get favoriteBooksIds => userBookCollections
      .where((e) => e.collections.contains(BooksCollection.favorite))
      .map((e) => e.bookId)
      .toList();
  List<String?> get readingNowBooksIds => userBookCollections
      .where((e) => e.collections.contains(BooksCollection.readingNow))
      .map((e) => e.bookId)
      .toList();
  List<String?> get completedReadingBooksIds => userBookCollections
      .where((e) => e.collections.contains(BooksCollection.completedReading))
      .map((e) => e.bookId)
      .toList();

  BaseUserBookCollection? getBookUserCollectionInfo(BaseBook book) {
    return userBookCollections.firstWhereOrNull((BaseUserBookCollection e) {
      return e.bookId == book.id;
    });
  }

  @override
  List<Object?> get props => [userBookCollections, explorePageBooks];

  @override
  String toString() {
    return '''
          $runtimeType(
          ExplorePageBooks: $explorePageBooks,
          UserBookCollections: (
            favorite:${favoriteBooksIds.length},
            reading now: ${readingNowBooksIds.length},
            completed reading: ${completedReadingBooksIds.length})
          )''';
  }

  LibraryBooks withAddedToUserBookCollections(
      List<BaseUserBookCollection> newBookCollections) {
    return copyWith(
        userBookCollections: <BaseUserBookCollection>{
      ...userBookCollections,
      ...newBookCollections
    }.toList());
  }

  LibraryBooks copyWith({
    List<BaseUserBookCollection>? userBookCollections,
    ExplorePageBooks? explorePageBooks,
  }) {
    return LibraryBooks(
      userBookCollections: userBookCollections ?? this.userBookCollections,
      explorePageBooks: explorePageBooks ?? this.explorePageBooks,
    );
  }
}

class ExplorePageBooks extends Equatable {
  final List<BaseBook> recommendedBooks;
  final List<BaseBook> mostPopularBooks;

  const ExplorePageBooks({
    this.recommendedBooks = const [],
    this.mostPopularBooks = const [],
  });

  @override
  List<Object?> get props => [recommendedBooks, mostPopularBooks];
  @override
  String toString() {
    return '$runtimeType: {recommended: ${recommendedBooks.length}, '
        'most popular: ${mostPopularBooks.length}';
  }

  ExplorePageBooks copyWith({
    List<BaseBook>? recommendedBooks,
    List<BaseBook>? mostPopularBooks,
  }) {
    return ExplorePageBooks(
      recommendedBooks: recommendedBooks ?? this.recommendedBooks,
      mostPopularBooks: mostPopularBooks ?? this.mostPopularBooks,
    );
  }
}

abstract class LibraryLoadingState {
  const LibraryLoadingState();
}

abstract class LibraryLoadingCompletedState {
  const LibraryLoadingCompletedState();
}

class LoadingMostPopularBooks extends LibraryLoadingState {
  const LoadingMostPopularBooks();
}

class LoadingRecommendedBooks extends LibraryLoadingState {
  const LoadingRecommendedBooks();
}

class LoadingReadingNowBooks extends LibraryLoadingState {
  const LoadingReadingNowBooks();
}

class LoadingCompletedReadingBooks extends LibraryLoadingState {
  const LoadingCompletedReadingBooks();
}

class LoadingFavoriteBooks extends LibraryLoadingState {
  const LoadingFavoriteBooks();
}

abstract class LibraryError extends Equatable {
  final AppError error;

  const LibraryError(this.error);
  @override
  List<Object?> get props => [error];
}

class FailedToLoadRecommendedBooks extends LibraryError {
  const FailedToLoadRecommendedBooks(super.error);
}

class FailedToLoadMostPopularBooks extends LibraryError {
  const FailedToLoadMostPopularBooks(super.error);
}

class FailedToLoadReadingNowBooks extends LibraryError {
  const FailedToLoadReadingNowBooks(super.error);
}

class FailedToLoadCompletedReadingBooks extends LibraryError {
  const FailedToLoadCompletedReadingBooks(super.error);
}

class FailedToLoadFavoriteBooks extends LibraryError {
  const FailedToLoadFavoriteBooks(super.error);
}

class FailedToAddBooksToUserCollection extends LibraryError {
  const FailedToAddBooksToUserCollection(super.error);
}

class LibrarySearchFailed extends LibraryError {
  const LibrarySearchFailed(super.error);
}

class AddingBooksToUserCollectionInProgress extends LibraryLoadingState {
  const AddingBooksToUserCollectionInProgress();
}

class AddingBooksToUserCollectionSuccess extends LibraryLoadingCompletedState {
  const AddingBooksToUserCollectionSuccess();
}

class LibrarySearchInProgress extends LibraryLoadingState {
  const LibrarySearchInProgress();
}
