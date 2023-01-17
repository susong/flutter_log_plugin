import 'package:logger/logger.dart';

import 'flutter_log_plugin.dart';

/// 输出日志到原生端
class LogHostOutput extends LogOutput {
  final _log = FlutterLogPlugin();
  final _tag = 'flutter';

  @override
  void output(OutputEvent event) {
    switch (event.level) {
      case Level.error:
        event.lines.forEach((msg) {
          _log.e(_tag, msg);
        });
        break;
      case Level.warning:
        event.lines.forEach((msg) {
          _log.w(_tag, msg);
        });
        break;
      case Level.info:
        event.lines.forEach((msg) {
          _log.i(_tag, msg);
        });
        break;
      case Level.verbose:
        event.lines.forEach((msg) {
          _log.v(_tag, msg);
        });
        break;
      default:
        event.lines.forEach((msg) {
          _log.d(_tag, msg);
        });
        break;
    }
  }
}
