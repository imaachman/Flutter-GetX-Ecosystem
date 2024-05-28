import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A mock login page that simulates a user logging in.
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.back(),
          child: Text('Login'),
        ),
      ),
    );
  }
}
