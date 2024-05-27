import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Home page that navigates to the settings and profile pages.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator 2.0 Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Go to the settings page.
            ElevatedButton(
              onPressed: () => Get.rootDelegate.toNamed('/settings'),
              child: Text('Settings'),
            ),
            SizedBox(height: 24),

            // Go to the profile page.
            ElevatedButton(
              onPressed: () => Get.rootDelegate.toNamed('/profile'),
              child: Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
