import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
              // Standard translation.
              Text(
                'greeting'.tr,
                style: Get.textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),

              // Translation with arguments.
              Text(
                'greeting'.trArgs(['Aachman']),
                style: Get.textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),

              // Translation with parameters.
              Text(
                'welcome'.trParams({'name': 'Aachman'}),
                style: Get.textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),

              // Pluralization.
              Text(
                'product'.trPluralParams('products', 4, {'count': 'four'}),
                style: Get.textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              Divider(height: 100),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
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
