import 'package:flutter/material.dart';
import 'package:flutter_log_plugin/log.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
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
            ],
          ),
        ),
      ),
    );
  }
}
