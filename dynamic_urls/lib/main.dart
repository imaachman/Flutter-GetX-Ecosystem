import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';
import 'profile.dart';

void main() => runApp(const DynamicURLsDemo());

class DynamicURLsDemo extends StatelessWidget {
  const DynamicURLsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: false),
      getPages: [
        GetPage(name: '/', page: () => Home()),
        // The :user part of the path is a parameter that can be used to
        // specify the user's name.
        GetPage(name: '/profile/:user', page: () => Profile())
      ],
    );
  }
}
