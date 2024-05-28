import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'labeled_switch.dart';

/// A widget that lets the user enter their name and toggle various settings.
/// Based on the user's settings, the middleware performs various actions.
/// After tweaking the settings, the user can navigate to the profile page by
/// tapping the floating action button.
class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Inject the controller.
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Middleware Demo'),
      ),
      body: Center(
        child: Obx(
          () => SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Enter the user's name.
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter user\'s name',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => controller.userName.value = value,
                ),
                SizedBox(height: 24),

                // Whether the user is logged in.
                LabeledSwitch(
                  label: 'Logged In',
                  value: controller.isLoggedIn.value,
                  onChanged: (value) => controller.isLoggedIn.value = value,
                ),
                SizedBox(height: 24),

                // Whether the user has admin access.
                LabeledSwitch(
                  label: 'Allow Admin Access',
                  value: controller.allowAdminAccess.value,
                  onChanged: (value) =>
                      controller.allowAdminAccess.value = value,
                ),
                SizedBox(height: 24),

                // Whether to set dark mode.
                LabeledSwitch(
                  label: 'Set Dark Mode',
                  value: controller.setDarkMode.value,
                  onChanged: (value) => controller.setDarkMode.value = value,
                ),
                SizedBox(height: 24),

                // Whether to show ads.
                LabeledSwitch(
                  label: 'Show Ads',
                  value: controller.showAds.value,
                  onChanged: (value) => controller.showAds.value = value,
                ),
                SizedBox(height: 24),

                // Whether to disconnect from the server.
                LabeledSwitch(
                  label: 'Disconnect From Server',
                  value: controller.disconnect.value,
                  onChanged: (value) => controller.disconnect.value = value,
                ),
              ],
            ),
          ),
        ),
      ),
      // Navigate to the profile page.
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/profile'),
        child: Icon(Icons.arrow_forward),
      ),

      // Uncomment the following code to use Navigator 2.0.
      //
      // // Navigate to the profile page.
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Get.rootDelegate.toNamed('/profile'),
      //   child: Icon(Icons.arrow_forward),
      // ),
    );
  }
}
