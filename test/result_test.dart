import 'package:books_genie/support/result/result.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  test(
      "that any thrown error will be caught and a FailureResult will be returned with this error",
      () async {
    final thrownError = AppError(message: 'error');
    final Result<bool, AppError> result = await Result.fromStream((sink) async {
      await Future.delayed(const Duration(seconds: 1), () {
        throw thrownError;
      });
    });
    expect(result.isFailure, true);
    result.fold(ifFailure: (error) {
      expect(error, thrownError);
    });
  });
  test("that the right value is returned after adding it to the sink",
      () async {
    const resultValue = true;
    final Result<bool, AppError> result = await Result.fromStream((sink) async {
      await Future.delayed(const Duration(seconds: 1), () {
        sink.add(resultValue);
      });
    });
    expect(result.isSuccess, true);
    result.fold(ifSuccess: (value) {
      expect(value, resultValue);
    });
  });
}
