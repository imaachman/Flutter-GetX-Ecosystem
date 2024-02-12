import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

void main() => runApp(const GetBuilderDemo());

class GetBuilderDemo extends StatelessWidget {
  const GetBuilderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: Home(),
    );
  }
}
