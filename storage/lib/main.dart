import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'home.dart';

Future<void> main() async {
  // Initialize GetStorage with the name of the storage box.
  // Here, we are initializing the 'users' storage box.
  await GetStorage.init('users');
  runApp(const StorageDemo());
}

class StorageDemo extends StatelessWidget {
  const StorageDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: false),
      home: const Home(),
    );
  }
}
