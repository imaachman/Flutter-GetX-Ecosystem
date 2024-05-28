import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A wrapper around the profile page that implements its own local navigation
/// stack. This allows the profile page to navigate to the settings page without
/// affecting the global navigation stack.
class ProfilePageWrapper extends StatelessWidget {
  const ProfilePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Use a nested navigator to manage the local navigation stack.
    return Navigator(
      // Use [Get.nestedKey] to create a unique key for the nested navigator.
      key: Get.nestedKey(1),
      // Define '/profile' as the initial route.
      initialRoute: '/profile',
      // Define the routes for the nested navigator by mapping paths to pages.
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/profile':
            return GetPageRoute(
              page: () => const ProfilePage(),
            );
          case '/profile/settings':
            return GetPageRoute(
              page: () => const SettingsPage(),
            );
        }
        return null;
      },
    );
  }
}

/// Profile page that can navigate to the settings page.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go to Settings Page'),
          // Navigate to the settings page using the nested navigator with ID 1.
          onPressed: () => Get.toNamed('/profile/settings', id: 1),
        ),
      ),
    );
  }
}

/// Settings page.
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Text('Settings Page'),
      ),
      body: const Center(
        child: Text(
          'See user settings here!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
