import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';
import 'service.dart';

Future<void> main() async {
  await Get.putAsync(() => StorageService().init());
  runApp(const GetxServiceDemo());
}

class GetxServiceDemo extends StatelessWidget {
  const GetxServiceDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Home(),
    );
  }
}
