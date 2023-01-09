import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_log_plugin/flutter_log_plugin.dart';
import 'package:flutter_log_plugin/flutter_log_plugin_platform_interface.dart';
import 'package:flutter_log_plugin/flutter_log_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterLogPluginPlatform 
    with MockPlatformInterfaceMixin
    implements FlutterLogPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterLogPluginPlatform initialPlatform = FlutterLogPluginPlatform.instance;

  test('$MethodChannelFlutterLogPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterLogPlugin>());
  });

  test('getPlatformVersion', () async {
    FlutterLogPlugin flutterLogPlugin = FlutterLogPlugin();
    MockFlutterLogPluginPlatform fakePlatform = MockFlutterLogPluginPlatform();
    FlutterLogPluginPlatform.instance = fakePlatform;
  
    expect(await flutterLogPlugin.getPlatformVersion(), '42');
  });
}
