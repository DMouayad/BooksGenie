import 'package:books_finder/books_finder.dart';
import 'package:books_genie/domain/book/base/entities/base_book.dart';
import 'package:books_genie/domain/book/data/firebase/models/firebase_book_info.dart';
import 'package:books_genie/support/utils/extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_sale_info.dart';
import 'dart:core';

class FirebaseBook extends BaseBook {
  FirebaseBook({
    required super.googleBookId,
    super.id,
    required super.info,
    required super.saleInfo,
    super.selfLink,
    super.etag,
  });

  factory FirebaseBook.fromGoogleBook(Book book) {
    return FirebaseBook(
      googleBookId: book.id,
      id: book.id,
      info: FirebaseBookInfo.tryFromMap(book.info.toJson()),
      saleInfo: FirebaseSaleInfo.fromMap(
        book.saleInfo.toJson(),
      ),
      etag: book.etag,
      selfLink: book.selfLink,
    );
  }
  factory FirebaseBook.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return FirebaseBook(
      id: data?.whereKey('id'),
      googleBookId: data?['googleBookId'],
      saleInfo: FirebaseSaleInfo.tryFromMap(data?.whereKey('saleInfo')),
      info: FirebaseBookInfo.tryFromMap(data?.whereKey('info')),
      selfLink: Uri.tryParse(data?.whereKey('selfLink')),
      etag: data?.whereKey('etag'),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) 'id': id,
      "googleBookId": googleBookId,
      'info': info.toMap(),
      'saleInfo': saleInfo.toMap(),
      if (etag != null) 'etag': etag,
      if (selfLink != null) 'selfLink': selfLink.toString(),
    };
  }
}
