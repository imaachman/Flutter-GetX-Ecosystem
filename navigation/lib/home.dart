import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Home page that navigates to the settings and profile pages.
/// It also demonstrates what happens when a mistake is made while navigating.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Go to the settings page.
            ElevatedButton(
              onPressed: () => Get.toNamed('/settings'),
              child: Text('Settings'),
            ),
            SizedBox(height: 24),

            // Go to the profile page.
            ElevatedButton(
              onPressed: () => Get.toNamed('/profile'),
              child: Text('Profile'),
            ),
            SizedBox(height: 24),

            // Making a mistake while navigating takes us to the unknown page.
            // As a demonstration, we are navigating to '/make-mistake' which is
            // not defined in the app.
            ElevatedButton(
              onPressed: () => Get.toNamed('/make-mistake'),
              child: Text('Make mistake'),
            ),
          ],
        ),
      ),
    );
  }
}
