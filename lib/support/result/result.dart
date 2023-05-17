library result;

import 'dart:async';
import 'dart:convert';

import 'package:books_genie/support/error/app_error.dart';
import 'package:books_genie/support/error/app_exception.dart';
import 'package:books_genie/support/error/exception_handler.dart';
import 'package:books_genie/support/services/logger_service.dart';

//
export 'package:books_genie/support/error/app_error.dart';
export 'package:books_genie/support/error/app_exception.dart';

part 'failure_result.dart';
part 'success_result.dart';

/// A class Represents the result of the execution of a function
/// either with a success or an error.
/// #### Simple constructors:
/// - Successful: ```
///   SuccessResult(result)
///   ```
/// - Unsuccessful: ```
///   AppError error)
///   ```
///
/// #### For More Info refer to:
/// - [SuccessResult]
/// - [FailureResult]
///
///  **See also:**
/// * [ErrorCode] to represent a specific error type.
/// * [AppError] to define a custom error.
abstract class Result<V extends Object?, E extends AppError> {
  const Result._();

  bool get isSuccess => this is SuccessResult;
  bool get isFailure => this is FailureResult;

  Result<V, E> fold({
    void Function(V value)? ifSuccess,
    void Function(E error)? ifFailure,
  });

  Future<Result<V, E>> foldAsync({
    Future<void> Function(V value)? ifSuccess,
    Future<void> Function(E error)? ifFailure,
  });

  Future<Result<U, F>> mapSuccessAsync<U extends Object?, F extends AppError>(
    Future<U> Function(V value) transform,
  );

  Result<U, F> mapSuccess<U extends Object?, F extends AppError>(
    U Function(V value) transform,
  );
  Result<VoidValue, E> mapSuccessToVoid({void Function(V value) onSuccess});
  Future<Result<VoidValue, E>> mapSuccessToVoidAsync({
    Future<void> Function(V value) onSuccess,
  });

  Result<U, F> mapFailure<U extends Object, F extends AppError>(
      F Function(E error) transform);
  Future<Result<U, F>> mapFailureAsync<U extends Object, F extends AppError>(
    Future<F> Function(E error) transform,
  );

  Future<Result<U, F>>
      flatMapSuccessAsync<U extends Object, F extends AppError>(
    Future<Result<U, F>> Function(V value) transform,
  );

  Result<U, F> flatMapSuccess<U extends Object, F extends AppError>(
      Result<U, F> Function(V value) transform);

  Future<Result<U, F>>
      flatMapFailureAsync<U extends Object, F extends AppError>(
          Future<Result<U, F>> Function(E error) transform);

  Result<U, F> flatMapFailure<U extends Object, F extends AppError>(
      Result<U, F> Function(E error) transform);

  ///
  Result<U, F> flatMap<U extends Object, F extends AppError>({
    required Result<U, F> Function(V value) onSuccess,
    required Result<U, F> Function(E error) onFailure,
  });

  Future<Result<U, F>> flatMapAsync<U extends Object, F extends AppError>({
    required Future<Result<U, F>> Function(V value) onSuccess,
    required Future<Result<U, F>> Function(E error) onFailure,
  });

  ///
  Result<U, F> map<U extends Object, F extends AppError>({
    required U Function(V value) onSuccess,
    required F Function(E error) onFailure,
  });

  Future<Result<U, F>> mapAsync<U extends Object, F extends AppError>({
    required Future<U> Function(V value) onSuccess,
    required Future<F> Function(E error) onFailure,
  });

  U mapTo<U>({
    U Function(V value)? onSuccess,
    U Function(E error)? onFailure,
  });
  U mapSuccessTo<U>(U Function(V value) transform);
  U mapFailureTo<U>(U Function(E error) transform);
  Future<U> mapToAsync<U>({
    Future<U> Function(V value)? onSuccess,
    Future<U> Function(E error)? onFailure,
  });

  static Future<Result<U, V>> fromAsync<U, V extends AppError>(
      Future<U> Function() process) async {
    try {
      return SuccessResult(await process());
    } catch (e) {
      return ExceptionHandler.getResult(e);
    }
  }

  static Future<Result<U, V>> fromStream<U, V extends AppError>(
      Future<void> Function(StreamSink<U> sink) process) async {
    final streamController = StreamController<U>();
    final StreamSink<U> streamSink = streamController.sink;
    try {
      process(streamSink);

      final U value = await streamController.stream.first;
      await streamController.close();
      return SuccessResult(value);
    } catch (e) {
      Log.e(e);
      await streamController.close();
      return ExceptionHandler.getResult<U, V>(e);
    }
  }
}

typedef FutureResult<R extends Object?> = Future<Result<R, AppError>>;
typedef FutureResultOr<R extends Object?> = FutureOr<Result<R, AppError>>;
typedef FutureVoidResult = Future<Result<VoidValue, AppError>>;
typedef VoidResult = Result<VoidValue, AppError>;

class EitherValue<R1 extends Object, R2 extends Object> {
  final R1? firstValue;
  final R2? secondValue;
  bool get isFirst => firstValue != null;
  bool get isSecond => !isFirst && secondValue != null;
  factory EitherValue.first(R1 value) => EitherValue._(firstValue: value);
  factory EitherValue.second(R2 value) => EitherValue._(secondValue: value);

  void fold({void Function(R1)? onFirst, void Function(R2)? onSecond}) {
    if (isFirst && onFirst != null) {
      onFirst(firstValue!);
    } else if (isSecond && onSecond != null) {
      onSecond(secondValue!);
    }
  }

  const EitherValue._({this.firstValue, this.secondValue})
      : assert(
          firstValue == null || secondValue == null,
        );
}

class VoidValue extends Object {
  const VoidValue();
}

abstract class NoValueObtained extends Object {}

class JsonObjectResult extends Object {
  final Map<String, dynamic> jsonObj;

  const JsonObjectResult(this.jsonObj);
}

extension AsyncResultExtension<V, E extends AppError> on Future<Result<V, E>> {
  Future<R> foldThen<R>(
    FutureOr<R> Function(V value) onSuccess, {
    Function(E)? onFailure,
  }) async {
    return (await this).mapToAsync(
      onSuccess: (value) async => await onSuccess(value),
      onFailure: (error) => onFailure != null ? onFailure(error) : null,
    );
  }
}
