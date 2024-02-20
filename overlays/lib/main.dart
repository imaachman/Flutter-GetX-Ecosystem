import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

void main() => runApp(const OverlaysDemo());

class OverlaysDemo extends StatelessWidget {
  const OverlaysDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: false),
      home: const Home(),
    );
  }
}
