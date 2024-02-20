import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings.dart';
import 'home.dart';

void main() => runApp(const GetLazyPutDemo());

class GetLazyPutDemo extends StatelessWidget {
  const GetLazyPutDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: false),
      darkTheme: ThemeData.dark(useMaterial3: false),
      // Dependencies in HomeBinding are created based on the theme mode.
      // So, setting a different theme mode before the app starts leads to a
      // different instance of the controller being created.
      themeMode: ThemeMode.light,
      initialBinding: HomeBinding(),
      home: const Home(),
    );
  }
}
