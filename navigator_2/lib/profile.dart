import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Profile page that navigates to the profile settings and profile edit pages.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Go to the profile settings page.
            ElevatedButton(
              onPressed: () => Get.rootDelegate.toNamed('/profile/settings'),
              child: Text('Profile settings'),
            ),
            SizedBox(height: 24),

            // Go to the profile edit page.
            ElevatedButton(
              onPressed: () => Get.rootDelegate.toNamed('/profile/edit'),
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
