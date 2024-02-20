import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

void main() => runApp(const GetConnectConfigurationDemo());

class GetConnectConfigurationDemo extends StatelessWidget {
  const GetConnectConfigurationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: false),
      home: Home(),
    );
  }
}
