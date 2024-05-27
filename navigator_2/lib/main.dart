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
      theme: ThemeData.light(useMaterial3: false),

      // Define initial route in the [routeInformationParser].
      // [createInformationParser] is a helper method that creates a
      // [GetRouteInformationParser] with the initial route. We provide
      // '/home' as the initial route.
      routeInformationParser:
          Get.createInformationParser(initialRoute: '/home'),

      getPages: [
        // Define all the pages in the app.
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(
          name: '/profile',
          page: () => const ProfilePage(),

          // Defining sub-pages lets us navigate to them using their path.
          // For example, we can navigate to the profile edit page using
          // '/profile/edit'.
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
