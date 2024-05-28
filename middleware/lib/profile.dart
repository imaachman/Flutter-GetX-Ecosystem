import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

/// A page that displays the user's profile information. By default, the user's
/// name is displayed. If the user has admin access, the admin controller is
/// initialized and a message is displayed.
class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  // Get the controller instance.
  final Controller controller = Get.find();

  /// Returns the user's name from the controller. If the user's name is empty,
  /// 'Absent' is returned.
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
            // Check whether the admin controller is initialized using
            // [Get.isRegistered]. It is initialized in the middleware if the
            // user is has admin access.
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
