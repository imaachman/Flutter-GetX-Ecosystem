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
      theme: ThemeData.light(useMaterial3: false),
      getPages: [
        // Define the home page.
        GetPage(
          // '/' acts as the default route path.
          name: '/',
          // Map the home page to [Home] widget.
          page: () => const Home(),
          // Bind [HomeBinding] to the home page.
          binding: HomeBinding(),
        ),
      ],
    );
  }
}
