import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';
import 'login.dart';
import 'profile.dart';
import 'profile_edit.dart';
import 'profile_settings.dart';
import 'settings.dart';
import 'unknown.dart';

void main() => runApp(const NavigationDemo());

class NavigationDemo extends StatelessWidget {
  const NavigationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(useMaterial3: false),
      // The initial route is set to '/login' so that the app starts at the
      // login page.
      initialRoute: '/login',

      // Making a mistake while navigating takes us to the unknown page.
      unknownRoute: GetPage(name: '/not-found', page: () => NotFoundPage()),
      getPages: [
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(
          name: '/profile',
          page: () => const ProfilePage(),

          // Defining sub-pages lets us navigate to them using their path.
          children: [
            GetPage(name: '/edit', page: () => const ProfileEditPage()),
            GetPage(name: '/settings', page: () => const ProfileSettingsPage()),
          ],
        ),
        GetPage(name: '/settings', page: () => const SettingsPage()),
      ],
    );
  }
}
