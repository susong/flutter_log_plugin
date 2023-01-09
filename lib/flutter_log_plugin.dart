
import 'flutter_log_plugin_platform_interface.dart';

class FlutterLogPlugin {
  Future<String?> getPlatformVersion() {
    return FlutterLogPluginPlatform.instance.getPlatformVersion();
  }
}
