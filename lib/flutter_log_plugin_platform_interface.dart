import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_log_plugin_method_channel.dart';

abstract class FlutterLogPluginPlatform extends PlatformInterface {
  /// Constructs a FlutterLogPluginPlatform.
  FlutterLogPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterLogPluginPlatform _instance = MethodChannelFlutterLogPlugin();

  /// The default instance of [FlutterLogPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterLogPlugin].
  static FlutterLogPluginPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterLogPluginPlatform] when
  /// they register themselves.
  static set instance(FlutterLogPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
