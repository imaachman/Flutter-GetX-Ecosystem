import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A widget that displays the user's profile. It retrieves the user's name,
/// age, and whether they are an author from the URL parameters.
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the parameters from the URL.
    final Map<String, String?> parameters = Get.parameters;

    return Scaffold(
      appBar: AppBar(
        // Display the user's name in the app bar.
        title: Text('${parameters['user']}\'s Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Display the user's name, age, and whether they are an author.
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
