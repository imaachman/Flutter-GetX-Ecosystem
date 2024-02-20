import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'home.dart';

Future<void> main() async {
  // Initialize the controller and wait for it to complete before running the
  // app.
  await Get.putAsync<Controller>(() => Controller().init());
  runApp(const GetPutAsyncDemo());
}

class GetPutAsyncDemo extends StatelessWidget {
  const GetPutAsyncDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: false),
      home: Home(),
    );
  }
}
