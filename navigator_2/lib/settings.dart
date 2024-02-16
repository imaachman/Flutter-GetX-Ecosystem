import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
      ),
      body: Center(
        // Go back to the previous page.
        child: ElevatedButton(
          onPressed: () => Get.back(),
          child: Text('Go back'),
        ),
      ),
    );
  }
}
