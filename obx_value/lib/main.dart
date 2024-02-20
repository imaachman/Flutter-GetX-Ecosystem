import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

void main() => runApp(const ObxValueDemo());

class ObxValueDemo extends StatelessWidget {
  const ObxValueDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: false),
      darkTheme: ThemeData.dark(useMaterial3: false),
      home: const Home(),
    );
  }
}
