import 'package:books_genie/domain/book/base/entities/base_user_book_collection.dart';
import 'package:books_genie/domain/book/utils/enums/books_collection.dart';
import 'package:isar/isar.dart';
part 'isar_user_book_collection.g.dart';

@Collection(ignore: {'props', 'stringify', 'uid'})
class IsarUserBookCollection implements BaseUserBookCollection {
  Id? id = Isar.autoIncrement;

  IsarUserBookCollection({
    this.id,
    this.userId,
    this.bookId,
    this.collections = const [],
    this.completionPercent,
  });

  @override
  @Index(composite: [CompositeIndex('bookId')], replace: true, unique: true)
  int? userId;
  @override
  String? bookId;
  @override
  @enumerated
  List<BooksCollection> collections;
  @override
  double? completionPercent;

  @override
  List<Object?> get props =>
      [userId, bookId, collections, completionPercent, id];

  @override
  bool get stringify => true;

  @override
  String? get uid => id.toString();
}
