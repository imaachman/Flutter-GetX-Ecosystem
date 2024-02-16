import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';
import 'profile.dart';
import 'profile_edit.dart';
import 'profile_settings.dart';
import 'settings.dart';

void main() => runApp(const Navigator2Demo());

class Navigator2Demo extends StatelessWidget {
  const Navigator2Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      // Define initial route in the routeInformationParser.
      routeInformationParser:
          Get.createInformationParser(initialRoute: '/home'),
      getPages: [
        GetPage(name: '/home', page: () => const HomePage()),
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
