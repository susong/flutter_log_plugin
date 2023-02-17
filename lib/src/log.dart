import 'package:logger/logger.dart';

import 'log_host_output.dart';

/// 日志工具类
class Log {
  Log._();

  static final Logger _logger = Logger(
    filter: ProductionFilter(), // release版本也打印
    printer: PrettyPrinter(
      // 跳过方法调用栈的个数，用法看文档，分析调试源码后，传4可过滤包装的调用栈。
      stackTraceBeginIndex: 4,
      methodCount: 1,
      colors: false,
      printEmojis: false,
      printTime: false,
      noBoxingByDefault: true,
    ),
    output: LogHostOutput(),
  );

  static void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.v(message, error, stackTrace);
  }

  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message, error, stackTrace);
  }

  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message, error, stackTrace);
  }

  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message, error, stackTrace);
  }

  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error, stackTrace);
  }
}
