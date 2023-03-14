import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_log_plugin/log.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  init(() {
    runApp(const MyApp());
  });
}

/// 初始化
Future<void> init(VoidCallback callback) async {
// 全局异常捕获
  await _handleError(() async {
    callback();
  });
}

/// 全局异常捕获
/// 参考 https://github.com/crazecoder/flutter_bugly/blob/master/lib/src/flutter_bugly.dart
Future<void> _handleError(VoidCallback callback) async {
  // 全局异常捕获
  Isolate.current.addErrorListener(new RawReceivePort((dynamic pair) {
    var isolateError = pair as List<dynamic>;
    var _error = isolateError.first;
    var _stackTrace = isolateError.last;
    Zone.current.handleUncaughtError(_error, _stackTrace);
  }).sendPort);

  // 全局异常捕获
  await runZonedGuarded<Future<Null>>(() async {
    callback();
  }, (error, stack) async {
    Log.e('全局异常捕获', error, stack);
  });

  // 设置全局UI异常时，显示的界面
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return const Scaffold(
        body: Center(
      child: Text(
        "ERROR",
        style: TextStyle(fontSize: 36),
      ),
    ));
  };

  // Flutter 提供了 FlutterError 类，
  // 这个类的 onError 属性会在接收到框架异常时执行相应的回调
  // 我们使用 Zone 提供的 handleUncaughtError 语句，
  // 将 Flutter 框架的异常统一转发到当前的 Zone 中，
  // 这样我们就可以统一使用 Zone 去处理应用内的所有异常了
  FlutterError.onError = (FlutterErrorDetails details) {
    if (details.stack != null) {
      // 转发至 Zone 中
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    } else {
      FlutterError.presentError(details);
    }
  };
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    [
      Permission.storage,
      Permission.manageExternalStorage,
    ].request();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                  onPressed: () {
                    Log.v("this is verbose msg");
                  },
                  child: Text('Log.v')),
              TextButton(
                  onPressed: () {
                    Log.d("this is debug msg");
                  },
                  child: Text('Log.d')),
              TextButton(
                  onPressed: () {
                    Log.i("this is info msg");
                  },
                  child: Text('Log.i')),
              TextButton(
                  onPressed: () {
                    Log.w("this is warn msg");
                  },
                  child: Text('Log.w')),
              TextButton(
                  onPressed: () {
                    try {
                      throw Exception('测试抛异常');
                    } catch (e) {
                      Log.e("this is error msg", e);
                    }
                  },
                  child: Text('Log.e')),
              TextButton(
                  onPressed: () {
                    throw Exception('测试抛异常2');
                  },
                  child: Text('Log.e2')),
              TextButton(
                  onPressed: () {
                    throw Exception('测试抛异常3');
                  },
                  child: Text('Log.e3')),
            ],
          ),
        ),
      ),
    );
  }
}
