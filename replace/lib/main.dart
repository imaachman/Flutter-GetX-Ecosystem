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
