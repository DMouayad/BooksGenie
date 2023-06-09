import 'package:books_genie/domain/book/utils/enums/books_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class BaseUserBookCollection extends Equatable {
  final int? userId;
  final String? bookId;
  final List<BooksCollection> collections;
  final double? completionPercent;
  String? get uid => shortHash('userId:$userId,bookId:$bookId');

  const BaseUserBookCollection({
    this.userId,
    this.bookId,
    this.collections = const [],
    this.completionPercent,
  });

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [userId, bookId, collections, completionPercent];
}
