part of 'library_bloc.dart';

@immutable
abstract class LibraryState extends Equatable {
  const LibraryState();
  @override
  List<Object?> get props => [];
}

class LibraryBooksState extends LibraryState {
  const LibraryBooksState({
    this.userBookCollections = const [],
    this.searchResults = const [],
    this.explorePageBooks = const ExplorePageBooks(),
  });

  final List<BaseUserBookCollection> userBookCollections;
  final ExplorePageBooks explorePageBooks;
  final List<BaseBook> searchResults;

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
  List<Object?> get props =>
      [userBookCollections, explorePageBooks, searchResults];
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

  LibraryBooksState withAddedToUserBookCollections(
      List<BaseUserBookCollection> newBookCollections) {
    return copyWith(
        userBookCollections: <BaseUserBookCollection>{
      ...userBookCollections,
      ...newBookCollections
    }.toList());
  }

  LibraryBooksState copyWith({
    List<BaseUserBookCollection>? userBookCollections,
    ExplorePageBooks? explorePageBooks,
    List<BaseBook>? searchResults,
  }) {
    return LibraryBooksState(
      userBookCollections: userBookCollections ?? this.userBookCollections,
      explorePageBooks: explorePageBooks ?? this.explorePageBooks,
      searchResults: searchResults ?? this.searchResults,
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

class LibraryInitial extends LibraryState {
  const LibraryInitial();
}

class LoadingMostPopularBooks extends LibraryState {
  const LoadingMostPopularBooks();
}

class LoadingRecommendedBooks extends LibraryState {
  const LoadingRecommendedBooks();
}

class LoadingReadingNowBooks extends LibraryState {
  const LoadingReadingNowBooks();
}

class LoadingCompletedReadingBooks extends LibraryState {
  const LoadingCompletedReadingBooks();
}

class LoadingFavoriteBooks extends LibraryState {
  const LoadingFavoriteBooks();
}

abstract class LibraryErrorState extends LibraryState {
  final AppError error;

  const LibraryErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

class FailedToLoadRecommendedBooks extends LibraryErrorState {
  const FailedToLoadRecommendedBooks(super.error);
}

class FailedToLoadMostPopularBooks extends LibraryErrorState {
  const FailedToLoadMostPopularBooks(super.error);
}

class FailedToLoadReadingNowBooks extends LibraryErrorState {
  const FailedToLoadReadingNowBooks(super.error);
}

class FailedToLoadCompletedReadingBooks extends LibraryErrorState {
  const FailedToLoadCompletedReadingBooks(super.error);
}

class FailedToLoadFavoriteBooks extends LibraryErrorState {
  const FailedToLoadFavoriteBooks(super.error);
}

class FailedToAddBooksToUserCollection extends LibraryErrorState {
  const FailedToAddBooksToUserCollection(super.error);
}

class AddingBooksToUserCollectionInProgress extends LibraryState {
  const AddingBooksToUserCollectionInProgress();
}

class AddingBooksToUserCollectionSuccess extends LibraryState {
  const AddingBooksToUserCollectionSuccess();
}

class LibrarySearchInProgress extends LibraryState {
  const LibrarySearchInProgress();
}

class LibrarySearchCompleted extends LibraryState {
  final List<BaseBook> items;

  const LibrarySearchCompleted(this.items);

  @override
  String toString() {
    return '$runtimeType: {found: ${items.length} books}';
  }

  @override
  List<Object?> get props => [items];
}
