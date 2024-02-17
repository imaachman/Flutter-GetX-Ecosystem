import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obx_value/login.dart';
import 'package:obx_value/middleware.dart';
import 'package:obx_value/profile.dart';

import 'home.dart';

void main() => runApp(const MiddlewareDemo());

class MiddlewareDemo extends StatelessWidget {
  const MiddlewareDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      darkTheme: ThemeData.dark(),
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(
          name: '/profile',
          page: () => ProfilePage(),
          middlewares: [Middleware()],
        ),
      ],
    );

    // Uncomment the following code to use Navigator 2.0.
    // return GetMaterialApp.router(
    //   darkTheme: ThemeData.dark(),
    //   getPages: [
    //     GetPage(name: '/', page: () => HomePage()),
    //     GetPage(name: '/login', page: () => LoginPage()),
    //     GetPage(
    //       name: '/profile',
    //       page: () => ProfilePage(),
    //       middlewares: [Middleware()],
    //     ),
    //   ],
    // );
  }
}
