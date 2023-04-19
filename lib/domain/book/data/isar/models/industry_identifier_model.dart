import 'package:books_finder/books_finder.dart';
import 'package:books_genie/domain/book/base/entities/base_industry_identifier.dart';
import 'package:isar/isar.dart';
part 'industry_identifier_model.g.dart';

@embedded
class IndustryIdentifierModel extends BaseIndustryIdentifier {
  IndustryIdentifierModel({super.identifier, super.type});
}
