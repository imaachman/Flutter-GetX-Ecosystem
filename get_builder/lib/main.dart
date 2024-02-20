import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

void main() => runApp(const GetBuilderDemo());

class GetBuilderDemo extends StatelessWidget {
  const GetBuilderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: false),
      home: const Home(),
    );
  }
}
