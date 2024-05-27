import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Not found page that displays a 404 error message.
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Not Found'),
      ),
      body: Center(
        child: Text(
          '404: Page not found',
          style: Get.theme.textTheme.headlineLarge,
        ),
      ),
    );
  }
}
