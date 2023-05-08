import 'package:books_genie/blocs/preferences_cubit/preferences_cubit.dart';
import 'package:books_genie/domain/auth/base/base_auth_repository.dart';
import 'package:books_genie/domain/auth/data/firebase/firebase_auth_repository.dart';
import 'package:books_genie/domain/auth/data/isar/isar_auth_repository.dart';
import 'package:books_genie/domain/auth/data/isar/isar_user.dart';
import 'package:books_genie/domain/book/base/base_book_repository.dart';
import 'package:books_genie/domain/book/data/firebase/firebase_book_repository.dart';
import 'package:books_genie/domain/book/data/firebase/firebase_with_google_books_api_book_data_source.dart';
import 'package:books_genie/domain/book/data/isar/isar_book_data_source.dart';
import 'package:books_genie/domain/book/data/isar/isar_book_repository.dart';
import 'package:books_genie/domain/book/data/isar/isar_with_google_books_api_book_data_source.dart';
import 'package:books_genie/domain/book/data/isar/models/book_model.dart';
import 'package:books_genie/domain/book/data/isar/models/isar_user_book_collection.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

class DependenciesService {
  const DependenciesService();

  static Future<void> registerDependenciesForStorage(
      StorageOption storageOption) async {
    if (storageOption == StorageOption.offline) {
      await DependenciesService.registerIsarDependencies();
    } else if (storageOption == StorageOption.online) {
      await DependenciesService.registerFirebaseDependencies();
    }
  }

  static Future<void> registerIsarDependencies() async {
    GetIt.instance.registerSingletonAsync<Isar>(() async {
      return await Isar.open(
        [BookModelSchema, IsarUserBookCollectionSchema, IsarUserSchema],
      );
    });
    await GetIt.instance.isReady<Isar>().then((_) {
      GetIt.instance
        ..registerSingleton<BaseAuthRepository>(IsarAuthRepository())
        ..registerSingleton<IsarBookDataSource>(
            const IsarWithGoogleBooksApiBookDataSource())
        ..registerSingleton<BaseBookRepository>(IsarBookRepository());
    });
  }

  static Future<void> registerFirebaseDependencies() async {
    GetIt.instance
      ..registerSingleton<BaseAuthRepository>(FirebaseAuthRepository())
      ..registerSingleton<BaseBookRepository>(FirebaseBookRepository(
        const FirebaseWithGoogleBooksApiBookDataSource(),
      ));
  }
}
