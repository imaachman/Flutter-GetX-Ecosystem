import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings.dart';
import 'home.dart';

void main() => runApp(const GetPutDemo());

class GetPutDemo extends StatelessWidget {
  const GetPutDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: false),
      getPages: [
        GetPage(
          name: '/',
          page: () => Home(),
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
