import 'package:flutter/material.dart';
import 'dart:async';

import 'package:windows_texture_test/windows_texture_test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PlayerController _controller;

  @override
  void initState() {
    super.initState();

    initPlatformState();
  }

  Future<void> initPlatformState() async {
    _controller = PlayerController();

    await _controller.initialize();

    if (!mounted) return;

    setState(() {});
  }

  Widget playerView() {
    if (_controller == null || !_controller.value.isInitialized) {
      return const Text(
        'Not Initialized',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: PlayerView(_controller),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Text('Plugin example app!'),
        ),
        body: Center(
          child: playerView(),
        ),
      ),
    );
  }
}
