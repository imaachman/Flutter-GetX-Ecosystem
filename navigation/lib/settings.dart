import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Logging out should remove all the pages and take us to the
            // login page.
            ElevatedButton(
              onPressed: () => Get.offAllNamed('/login'),
              child: Text('Logout'),
            ),
            SizedBox(height: 24),

            // Go back to the previous page.
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('Go back'),
            ),
          ],
        ),
      ),
    );
  }
}
