import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';
import 'login.dart';
import 'middleware.dart';
import 'profile.dart';

void main() => runApp(const MiddlewareDemo());

class MiddlewareDemo extends StatelessWidget {
  const MiddlewareDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: false),
      darkTheme: ThemeData.dark(useMaterial3: false),
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
    //   theme: ThemeData.light(useMaterial3: false),
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
