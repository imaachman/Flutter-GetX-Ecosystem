import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePageWrapper extends StatelessWidget {
  const ProfilePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(1),
      initialRoute: '/profile',
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
          onPressed: () => Get.toNamed('/profile/settings', id: 1),
        ),
      ),
    );
  }
}

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
