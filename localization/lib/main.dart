import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localization/translations.dart';

import 'home.dart';

void main() => runApp(const LocalizationDemo());

class LocalizationDemo extends StatelessWidget {
  const LocalizationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: TranslationData(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      home: const Home(),
    );
  }
}
