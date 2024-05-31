import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

void main() => runApp(const ThemingDemo());

class ThemingDemo extends StatelessWidget {
  const ThemingDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Define the light theme.
      theme: ThemeData.light(useMaterial3: false),
      // Define the dark theme.
      darkTheme: ThemeData.dark(useMaterial3: false),
      home: const Home(),
    );
  }
}
