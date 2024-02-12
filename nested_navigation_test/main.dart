import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/home.dart';

void main() => runApp(SocialMediaApp());

class SocialMediaApp extends StatelessWidget {
  const SocialMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
