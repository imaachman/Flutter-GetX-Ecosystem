import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/home.dart';

void main() => runApp(const GetConnectConfigurationDemo());

class GetConnectConfigurationDemo extends StatelessWidget {
  const GetConnectConfigurationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Home(),
    );
  }
}
