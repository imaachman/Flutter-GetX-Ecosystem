import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'count_text.dart';

/// Home widget with a counter text and a floating action button to increment the
/// counter. It uses GetX to listen to the controller and update the UI.
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // GetX widget to listen to the controller notifications.
    return GetX<Controller>(
      // Initialize the controller.
      init: Controller(),
      // Builder to create the UI based on the controller state.
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('GetX Widget Demo'),
          ),
          body: Center(
            child: CountText(
              // Get the latest count from the controller.
              count: controller.count.toString(),
              color: Colors.blue,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            // Increment the count when the button is pressed.
            onPressed: () => controller.incrementCount(),
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
