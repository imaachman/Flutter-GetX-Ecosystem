import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic URLs Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: 'Enter user\'s name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                // Navigate to the profile page while providing the user's name.
                // Feel free to change the query values, i.e., age and author.
                // Changing the URL directly in the browser will also work.
                Get.toNamed(
                  '/profile/${textEditingController.text}?age=23&author=yes',
                );
              },
              child: Text('See profile'),
            ),
          ],
        ),
      ),
    );
  }
}
