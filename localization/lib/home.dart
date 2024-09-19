import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Home widget that displays text localized in different languages.
/// We can change the app's locale by pressing the buttons at the bottom and
/// see the text change accordingly.
class Home extends StatelessWidget {
  const Home({super.key});

  /// Get the correct translation for count '4'.
  /// Used in the plural translation of 'product' string.
  String get countTranslation {
    switch (Get.locale) {
      case Locale(languageCode: 'en', countryCode: 'US'):
        return 'four';
      case Locale(languageCode: 'de', countryCode: 'DE'):
        return 'vier';
      case Locale(languageCode: 'fr', countryCode: 'FR'):
        return 'quatre';
      case Locale(languageCode: 'es', countryCode: 'ES'):
        return 'cuatro';
      case Locale(languageCode: 'ja', countryCode: 'JP'):
        return '四';
      default:
        return 'four';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Localization Demo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Standard translation with [tr] extension.
              Text(
                'greeting'.tr,
                style: Get.textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),

              // Translation with arguments with [trArgs] extension.
              // 'Aachman' is the argument that will replace the %s in the
              // translation.
              Text(
                'greeting'.trArgs(['Aachman']),
                style: Get.textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),

              // Translation with parameters with [trParams] extension.
              // 'Aachman' is the parameter that will replace the @name in the
              // translation.
              Text(
                'welcome'.trParams({'name': 'Aachman'}),
                style: Get.textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),

              // Pluralization with [trPlural] extension.
              // The count is 4, so the plural form of the translation will be
              // used and @count will be replaced by 'four' or its counterparts
              // from other languages.
              Text(
                'product'
                    .trPluralParams('products', 4, {'count': countTranslation}),
                style: Get.textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              Divider(height: 100),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Buttons to change the app's locale to different languages.
                  ElevatedButton(
                    onPressed: () => Get.updateLocale(const Locale('en', 'US')),
                    child: Text('English'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () => Get.updateLocale(const Locale('de', 'DE')),
                    child: Text('German'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () => Get.updateLocale(const Locale('fr', 'FR')),
                    child: Text('French'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () => Get.updateLocale(const Locale('es', 'ES')),
                    child: Text('Spanish'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () => Get.updateLocale(const Locale('ja', 'JP')),
                    child: Text('Japanese'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
