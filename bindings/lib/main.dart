import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings.dart';
import 'home.dart';

void main() => runApp(const BindingsDemo());

class BindingsDemo extends StatelessWidget {
  const BindingsDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: false),
      getPages: [
        GetPage(
          name: '/',
          page: () => const Home(),
          // Bind the dependencies to the page.
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
