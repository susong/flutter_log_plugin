import 'package:logger/logger.dart';

import 'log_host_output.dart';

/// 日志工具类
class Log {
  Log._();

  static final Logger _logger = Logger(
    filter: ProductionFilter(), // release版本也打印
    printer: PrettyPrinter(
      // 跳过方法调用栈的个数，用法看文档，分析调试源码后，传1可过滤包装的调用栈。
      stackTraceBeginIndex: 1,
      // logger 1.3.0 版本，对methodCount实现进行了修改，真实的方法数为 methodCount-stackTraceBeginIndex
      methodCount: 3,
      errorMethodCount: 100,
      colors: false,
      printEmojis: false,
      printTime: false,
      noBoxingByDefault: true,
    ),
    output: LogHostOutput(),
  );

  static final Logger _logger2 = Logger(
    filter: ProductionFilter(), // release版本也打印
    printer: PrettyPrinter(
      errorMethodCount: 100,
      colors: false,
      printEmojis: false,
      printTime: false,
      noBoxingByDefault: true,
    ),
    output: LogHostOutput(),
  );

  static void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (stackTrace == null) {
      _logger.v(message, error, stackTrace);
    } else {
      _logger2.v(message, error, stackTrace);
    }
  }

  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (stackTrace == null) {
      _logger.d(message, error, stackTrace);
    } else {
      _logger2.d(message, error, stackTrace);
    }
  }

  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (stackTrace == null) {
      _logger.i(message, error, stackTrace);
    } else {
      _logger2.i(message, error, stackTrace);
    }
  }

  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (stackTrace == null) {
      _logger.w(message, error, stackTrace);
    } else {
      _logger2.w(message, error, stackTrace);
    }
  }

  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    if (stackTrace == null) {
      _logger.e(message, error, stackTrace);
    } else {
      _logger2.e(message, error, stackTrace);
    }
  }
}
