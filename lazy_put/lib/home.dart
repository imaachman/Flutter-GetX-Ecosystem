import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'count_text.dart';

/// Widget that displays the count and a button to change it.
/// If app's theme is light, pressing the button increments the count.
/// If app's theme is dark, pressing the button decrements the count.
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Get.lazyPut Demo')),
      body: Center(
        child: Obx(
          () => CountText(
            // Access BaseController instance using [Get.find].
            // Depending on the theme mode, this will return an instance of
            // [IncrementController] or [DecrementController].
            count: Get.find<BaseController>().count.toString(),
            color: Colors.blue,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        // Access BaseController instance using [Get.find].
        // Depending on the theme mode, this will return an instance of
        // [IncrementController] or [DecrementController].
        // So, pressing the button will either increment or decrement the count.
        onPressed: () => Get.find<BaseController>().changeCount(),
        child: const Icon(Icons.change_circle),
      ),
    );
  }
}
