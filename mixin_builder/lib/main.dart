import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

void main() => runApp(const MixinBuilderDemo());

class MixinBuilderDemo extends StatelessWidget {
  const MixinBuilderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: false),
      home: Home(),
    );
  }
}
