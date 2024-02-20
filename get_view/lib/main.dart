import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'home.dart';

void main() => runApp(const GetViewDemo());

class GetViewDemo extends StatelessWidget {
  const GetViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: false),
      getPages: [
        GetPage(
          name: '/',
          page: () => const Home(),
          binding: BindingsBuilder(() {
            Get.put<Controller>(Controller());
          }),
        ),
      ],
    );
  }
}
