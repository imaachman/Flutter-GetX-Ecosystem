import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

void main() => runApp(const ResponsivenessDemo());

class ResponsivenessDemo extends StatelessWidget {
  const ResponsivenessDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: false),
      home: HomePage(
        // Define custom breakpoints for different screen sizes.
        settings: const ResponsiveScreenSettings(
          desktopChangePoint: 1200,
          tabletChangePoint: 800,
          watchChangePoint: 600,
        ),
      ),
    );
  }
}
