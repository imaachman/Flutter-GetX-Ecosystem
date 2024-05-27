import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings.dart';
import 'counter.dart';
import 'home.dart';

void main() => runApp(const GetLazyReplaceDemo());

class GetLazyReplaceDemo extends StatelessWidget {
  const GetLazyReplaceDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: false),
      getPages: [
        // Define the home page.
        GetPage(
          name: '/',
          page: () => const Home(),
          // Bind the HomeBinding to the home page.
          binding: HomeBinding(),
        ),
        // Define the counter page.
        GetPage(
          name: '/counter',
          page: () => CounterPage(),
        )
      ],
    );
  }
}
