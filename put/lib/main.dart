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
        // Define the home page route.
        GetPage(
          // '/' acts as the default route path.
          name: '/',
          // Map the page to the [Home] widget.
          page: () => Home(),
          // Bind the dependencies to the page.
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
