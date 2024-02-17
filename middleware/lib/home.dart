import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obx_value/controller.dart';

import 'labeled_switch.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

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
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter user\'s name',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => controller.userName.value = value,
                ),
                SizedBox(height: 24),
                LabeledSwitch(
                  label: 'Logged In',
                  value: controller.isLoggedIn.value,
                  onChanged: (value) => controller.isLoggedIn.value = value,
                ),
                SizedBox(height: 24),
                LabeledSwitch(
                  label: 'Allow Admin Access',
                  value: controller.allowAdminAccess.value,
                  onChanged: (value) =>
                      controller.allowAdminAccess.value = value,
                ),
                SizedBox(height: 24),
                LabeledSwitch(
                  label: 'Set Dark Mode',
                  value: controller.setDarkMode.value,
                  onChanged: (value) => controller.setDarkMode.value = value,
                ),
                SizedBox(height: 24),
                LabeledSwitch(
                  label: 'Show Ads',
                  value: controller.showAds.value,
                  onChanged: (value) => controller.showAds.value = value,
                ),
                SizedBox(height: 24),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/profile'),
        child: Icon(Icons.arrow_forward),
      ),

      // Uncomment the following code to use Navigator 2.0.
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => Get.rootDelegate.toNamed('/profile'),
      //   child: Icon(Icons.arrow_forward),
      // ),
    );
  }
}
