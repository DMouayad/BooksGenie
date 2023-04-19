import 'package:books_genie/domain/book/utils/enums/book_cover_size.dart';
export 'package:books_genie/domain/book/utils/enums/book_cover_size.dart';

abstract class BaseCoverImageLink {
  final String? url;
  final BookCoverSize size;

  const BaseCoverImageLink({
    this.url,
    this.size = BookCoverSize.defaultThumbnail,
  });
  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'size': size.index,
    };
  }

  @override
  String toString() {
    return 'CoverImageLink(url:$url, size:${size.name})';
  }
}
