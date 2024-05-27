import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Profile edit page that saves the edits and goes back to the profile page.
class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Edit Page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Saving the edits takes us back to the profile page.
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('Save edits'),
            ),
          ],
        ),
      ),
    );
  }
}
