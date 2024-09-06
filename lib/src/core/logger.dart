import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

abstract interface class Logger {
  /// Log a new debug message
  /// [dynamic] [message] - message describes what happened
  /// [Object?] [exception] - exception if it happened
  /// [StackTrace?] [stackTrace] - stackTrace if [exception] happened
  ///
  /// ```dart
  ///   logger.debug('Log debug');
  /// ```
  void debug(
    dynamic msg, [
    Object? exception,
    StackTrace? stackTrace,
  ]);

  /// Log a new error message
  /// [dynamic] [message] - message describes what happened
  /// [Object?] [exception] - exception if it happened
  /// [StackTrace?] [stackTrace] - stackTrace if [exception] happened
  ///
  /// ```dart
  ///   logger.error('Log error');
  /// ```
  void error(
    dynamic msg, [
    Object? exception,
    StackTrace? stackTrace,
  ]);

  /// Log a new info message
  /// [dynamic] [message] - message describes what happened
  /// [Object?] [exception] - exception if it happened
  /// [StackTrace?] [stackTrace] - stackTrace if [exception] happened
  ///
  /// ```dart
  ///   logger.info('Log info');
  /// ```
  void info(
    dynamic msg, [
    Object? exception,
    StackTrace? stackTrace,
  ]);
}

/// Заглушка вместо talker
@Singleton(as: Logger)
class LoggerImpl implements Logger {
  static void printer(String? message, {int? wrapWidth}) {
    if (message == null) {
      return;
    }
    if (kIsWeb) {
      // ignore: avoid_print
      return print(message);
    }

    return log(message, name: '⬞');
  }

  @override
  void debug(msg, [Object? exception, StackTrace? stackTrace]) {
    printer(msg);
  }

  @override
  void error(msg, [Object? exception, StackTrace? stackTrace]) {
    printer(msg);
  }

  @override
  void info(msg, [Object? exception, StackTrace? stackTrace]) {
    printer(msg);
  }
}
