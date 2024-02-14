import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obx_value/counter.dart';

import 'bindings.dart';
import 'home.dart';

void main() => runApp(const GetLazyReplaceDemo());

class GetLazyReplaceDemo extends StatelessWidget {
  const GetLazyReplaceDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      darkTheme: ThemeData.dark(),
      getPages: [
        GetPage(
          name: '/',
          page: () => const Home(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/counter',
          page: () => CounterPage(),
        )
      ],
    );
  }
}
