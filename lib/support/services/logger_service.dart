import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class Log {
  late Logger _logger;

  Log._internal() {
    _logger = Logger(
      printer: PrettyPrinter(
        errorMethodCount: 3,
        printEmojis: true,
        methodCount: 0,
      ),
    );
  }

  static Logger to = _instance._logger;

  factory Log() => _instance;

  static final Log _instance = Log._internal();

  static void v(dynamic message) {
    to.v(message);
  }

  static void d(dynamic message) {
    to.d(message);
  }

  static void i(dynamic message) {
    to.i(message);
  }

  static void w(dynamic message) {
    to.w(message);
  }

  static void e(dynamic message) {
    to.e(message);
  }

  static void wtf(dynamic message) {
    to.wtf(message);
  }

  /// Logs a [Cubit]'s state changes
  static void logCubitChange(
    Cubit cubit,
    Change change, {
    Level logLevel = Level.info,
  }) {
    final message = '''<${cubit.runtimeType} State Change>
        From:  ${change.currentState}
        To:    ${change.nextState}
      ''';
    _logByLevel(logLevel, message);
  }

  /// Logs a [Bloc] state transition, from a state to another, caused by an Event
  static void logBlocTransition(Bloc bloc, Transition transition) {
    final message = '''<${bloc.runtimeType} transition>
        From:  ${transition.currentState}   
        To:    ${transition.nextState}     
        After: ${transition.event.runtimeType}
      ''';
    to.i(message);
  }

  static void _logByLevel(Level logLevel, String message) {
    switch (logLevel) {
      case Level.info:
        to.i(message);
        break;
      case Level.warning:
        to.w(message);
        break;

      case Level.error:
        to.e(message);
        break;
      default:
        throw UnimplementedError();
    }
  }
}
