import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        // Logging in should take us to the home page while removing the login
        // page from the stack.
        child: ElevatedButton(
          onPressed: () => Get.offNamed('/home'),
          child: Text('Login'),
        ),
      ),
    );
  }
}
