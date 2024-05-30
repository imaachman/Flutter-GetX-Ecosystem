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
      theme: ThemeData.light(useMaterial3: false),
      // Load the translations data.
      translations: TranslationData(),
      // Use device's locale as the default app locale.
      locale: Get.deviceLocale,
      // Fallback locale in case the device locale is not supported.
      // We are using English (US) as the fallback locale.
      fallbackLocale: const Locale('en', 'US'),
      home: const Home(),
    );
  }
}
