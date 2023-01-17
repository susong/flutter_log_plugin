import 'flutter_log_plugin_platform_interface.dart';

class FlutterLogPlugin {
  Future<String?> getPlatformVersion() {
    return FlutterLogPluginPlatform.instance.getPlatformVersion();
  }

  Future<void> v(String tag, String? msg) async {
    log('v', tag, msg);
  }

  Future<void> d(String tag, String? msg) async {
    log('d', tag, msg);
  }

  Future<void> i(String tag, String? msg) async {
    log('i', tag, msg);
  }

  Future<void> w(String tag, String? msg) async {
    log('w', tag, msg);
  }

  Future<void> e(String tag, String? msg) async {
    log('e', tag, msg);
  }

  Future<void> log(String level, String tag, String? msg) {
    return FlutterLogPluginPlatform.instance.log(level, tag, msg);
  }
}
