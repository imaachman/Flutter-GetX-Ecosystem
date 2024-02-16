import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the parameters from the URL.
    final Map<String, String?> parameters = Get.parameters;

    return Scaffold(
      appBar: AppBar(
        title: Text('${parameters['user']}\'s Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Name: ${parameters['user']}',
              style: Get.theme.textTheme.titleLarge,
            ),
            SizedBox(height: 24),
            Text(
              'Age: ${parameters['age']}',
              style: Get.theme.textTheme.titleLarge,
            ),
            SizedBox(height: 24),
            Text(
              'Author: ${parameters['author']}',
              style: Get.theme.textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
