import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Profile settings page that demonstrates different ways to navigate to other
/// pages. It demonstrates [Get.rootDelegate.offAndToNamed] and
/// [Get.rootDelegate.backUntil] methods.
class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Settings Page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Saving profile settings takes us to the all settings page and
            // removes this page from the stack. Now when we go back, we're
            // taken to the profile page.
            ElevatedButton(
              onPressed: () => Get.rootDelegate.offAndToNamed('/settings'),
              child: Text('Save profile settings'),
            ),
            SizedBox(height: 24),

            // Going to the home page removes all pages from the stack.
            ElevatedButton(
              onPressed: () => Get.rootDelegate.backUntil('/home'),
              child: Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
