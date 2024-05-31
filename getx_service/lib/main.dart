import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';
import 'service.dart';

Future<void> main() async {
  // Initialize the storage service before running the app.
  // We use [Get.putAsync] to initialize the service asynchronously.
  await Get.putAsync(() => StorageService().init());
  runApp(const GetxServiceDemo());
}

class GetxServiceDemo extends StatelessWidget {
  const GetxServiceDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: false),
      home: Home(),
    );
  }
}
