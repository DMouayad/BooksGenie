import 'package:books_genie/domain/book/base/entities/base_cover_image_link.dart';
import 'package:isar/isar.dart';
part 'cover_image_link.g.dart';

@embedded
class CoverImageLinkModel extends BaseCoverImageLink {
  CoverImageLinkModel({super.url, super.size});
  @override
  @enumerated
  BookCoverSize get size => super.size;
}
