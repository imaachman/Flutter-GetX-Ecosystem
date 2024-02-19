import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'home.dart';

Future<void> main() async {
  await GetStorage.init('users');
  runApp(const StorageDemo());
}

class StorageDemo extends StatelessWidget {
  const StorageDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: Home(),
    );
  }
}
