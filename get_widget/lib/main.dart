import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings.dart';
import 'home.dart';

void main() => runApp(const GetWidgetDemo());

class GetWidgetDemo extends StatelessWidget {
  const GetWidgetDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: '/',
          page: () => const Home(),
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
