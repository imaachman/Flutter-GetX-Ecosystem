import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/home.dart';

void main() => runApp(const RestApiDemo());

class RestApiDemo extends StatelessWidget {
  const RestApiDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Home(),
    );
  }
}
