import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final Controller controller = Get.find();

  String getUserName() {
    return controller.userName.value.isEmpty
        ? 'Absent'
        : controller.userName.value;
  }

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
            Text(
              'User\'s name: ${getUserName()}',
              style: Get.textTheme.headlineLarge,
            ),
            // Check whether the admin controller is initialized.
            // It is initialized in the middleware if the user is has admin
            // access.
            if (Get.isRegistered<AdminController>()) ...[
              SizedBox(height: 24),
              Text(
                'Admin Priviliges Unlocked!',
                style: Get.textTheme.headlineLarge,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
