import 'package:books_genie/domain/book/base/entities/base_user_book_collection.dart';
import 'package:books_genie/domain/book/utils/enums/books_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:books_genie/support/utils/extensions.dart';

class FirebaseUserBookCollection extends BaseUserBookCollection {
  FirebaseUserBookCollection({
    super.bookId,
    super.userId,
    super.completionPercent,
    super.collections = const [],
  });
  factory FirebaseUserBookCollection.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return FirebaseUserBookCollection(
      bookId: data?['bookId'],
      userId: data?.whereKey('userId'),
      collections: data?.whereKey('collections') is List
          ? (data?.whereKey('collections') as List)
              .map((e) => BooksCollection.values[int.parse(e)])
              .toList()
          : [],
      completionPercent: data?.whereKey('completionPercent'),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "bookId": bookId,
      'userId': userId,
      "collections": collections.map((e) => e.index).toList(),
      'completionPercent': completionPercent,
    };
  }
}
