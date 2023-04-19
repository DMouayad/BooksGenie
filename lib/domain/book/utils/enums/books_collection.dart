import 'package:books_genie/support/utils/extensions.dart';

enum BooksCollection {
  favorite,
  readingNow,
  completedReading;

  static List<BooksCollection> getCollectionsFor(
    bool? isFavorite,
    double? completionPercent,
  ) {
    List<BooksCollection> collections = [];
    isFavorite != null && isFavorite
        ? collections.addIfNotPresent(BooksCollection.favorite)
        : collections.remove(BooksCollection.favorite);
    if (completionPercent == null) {
      collections.remove(BooksCollection.readingNow);
      collections.remove(BooksCollection.completedReading);
    } else {
      if (completionPercent == 100) {
        collections.add(BooksCollection.completedReading);
      }
      if (completionPercent >= 0) {
        collections.add(BooksCollection.readingNow);
      }
    }
    return collections;
  }
}
