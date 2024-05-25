import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings.dart';
import 'home.dart';

void main() => runApp(const GetCreateDemo());

class GetCreateDemo extends StatelessWidget {
  const GetCreateDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: false),
      getPages: [
        // Define the home page.
        GetPage(
          // '/' acts as the default route.
          name: '/',
          // Map the home page to the [Home] widget.
          page: () => const Home(),
          // Bind the [HomeBinding] to the home page route.
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
