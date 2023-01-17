import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'dart:developer';

/// 临时解决无法打印长字符串日志的问题
/// 参考：https://github.com/leisim/logger/issues/60
class LogConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    event.lines.forEach(log);
    // event.lines.forEach(printWrapped);
    // event.lines.forEach(printWrapped2);
  }

  void printWrapped(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  // This works too.
  void printWrapped2(String text) => debugPrint(text, wrapWidth: 1024);
}
