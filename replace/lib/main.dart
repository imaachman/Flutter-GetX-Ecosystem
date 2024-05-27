import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings.dart';
import 'counter.dart';
import 'home.dart';

void main() => runApp(const GetReplaceDemo());

class GetReplaceDemo extends StatelessWidget {
  const GetReplaceDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: false),
      getPages: [
        // Define home page.
        GetPage(
          name: '/',
          page: () => const Home(),
          // Bind HomeBinding to the home page to inject the controller.
          binding: HomeBinding(),
        ),
        // Define counter page.
        GetPage(
          name: '/counter',
          page: () => CounterPage(),
        )
      ],
    );
  }
}
