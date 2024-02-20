import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

void main() => runApp(const NestedNavigationDemo());

class NestedNavigationDemo extends StatelessWidget {
  const NestedNavigationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: false),
      home: HomePage(),
    );
  }
}
