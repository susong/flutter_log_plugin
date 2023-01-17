import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_log_plugin_platform_interface.dart';

/// An implementation of [FlutterLogPluginPlatform] that uses method channels.
class MethodChannelFlutterLogPlugin extends FlutterLogPluginPlatform {
  ///日志分割长度
  static const int _maxLen = 800;

  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_log_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> log(String level, String tag, String? msg) async {
    if (Platform.isAndroid) {
      await methodChannel
          .invokeMethod("log", {'level': level, 'tag': tag, 'msg': msg ?? ''});
    } else {
      _flutterPrint(level, tag, msg ?? '');
    }
  }

  void _flutterPrint(String level, String tag, String msg) {
    if (msg.length <= _maxLen) {
      print('$level $tag:$msg');
    } else {
      print(
          '$level $tag ======================== log start ======================');
      while (msg.isNotEmpty) {
        if (msg.length > _maxLen) {
          print('${msg.substring(0, _maxLen)}');
          msg = msg.substring(_maxLen, msg.length);
        } else {
          print(msg);
          msg = '';
        }
      }
      print(
          '$level $tag ======================== log end ========================');
    }
  }
}
