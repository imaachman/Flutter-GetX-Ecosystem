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
        // Define the home page.
        GetPage(
          // '/' acts as the default route path.
          name: '/',
          // Map the home page to [Home] widget.
          page: () => const Home(),
          // Bind [Controller] to the home page using [BindingsBuilder].
          binding: BindingsBuilder(() {
            // Inject instance of [Controller].
            Get.put<Controller>(Controller());
          }),
        ),
      ],
    );
  }
}
