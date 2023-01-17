import 'package:logger/logger.dart';

import 'flutter_log_plugin.dart';

/// 输出日志到原生端
class LogHostOutput extends LogOutput {
  final _log = FlutterLogPlugin();
  final _tag = 'flutter';

  @override
  void output(OutputEvent event) {
    var message = '';
    for (var msg in event.lines) {
      message = '$message$msg\r\n';
    }
    switch (event.level) {
      case Level.error:
        _log.e(_tag, message);
        break;
      case Level.warning:
        _log.w(_tag, message);
        break;
      case Level.info:
        _log.i(_tag, message);
        break;
      case Level.verbose:
        _log.v(_tag, message);
        break;
      default:
        _log.d(_tag, message);
        break;
    }
  }
}
