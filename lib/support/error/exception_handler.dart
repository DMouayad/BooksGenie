import 'dart:io';

import 'package:books_genie/support/services/logger_service.dart';
import 'package:books_genie/support/utils/app_exception_parser.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:isar/isar.dart';
import 'package:books_genie/support/result/result.dart';

class ExceptionHandler {
  static Result<U, V> getResult<U, V extends AppError>(dynamic e) {
    V? error;
    if (e is V) {
      error = e;
    } else if (e is IsarError) {
      error = AppError(message: e.message, st: e.stackTrace) as V;
    } else if (e is HttpException || e is IOException) {
      error = AppError(
        message: e.message,
        appException: AppException.cannotConnectToServer,
      ) as V;
    } else if (e is FirebaseException) {
      error = AppError(
        st: e.stackTrace,
        appException: AppExceptionParser.fromFirebaseExceptionCode(e.code),
      ) as V;
    } else if (e is String) {
      error = AppError(message: e) as V;
    } else if (e is Error) {
      error = AppError(
        st: e.stackTrace,
        description: e.toString(),
      ) as V;
    }
    // Log.e(error);

    return error != null ? FailureResult(error) : FailureResult(e);
  }
}
