import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

void main() => runApp(const WebSocketsDemo());

class WebSocketsDemo extends StatelessWidget {
  const WebSocketsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Home(),
    );
  }
}
