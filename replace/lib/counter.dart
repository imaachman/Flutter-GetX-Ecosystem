import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'count_text.dart';

/// Counter page of the app to display the count value and change it.
/// Depending on the injected controller, the count will either increment or
/// decrement.
class CounterPage extends StatelessWidget {
  CounterPage({super.key});

  // Find [BaseController] instance to access the count value and change it.
  // Depending on the controller injected in the home page, we will either
  // get an instance of [IncrementController] or [DecrementController].
  final BaseController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Counter Page'),
        ),
        body: Center(
          child: CountText(
            // Display the count value.
            count: controller.count.toString(),
            color: Colors.blue,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // Change the count value. Depending on the controller injected in the
          // home page, the count will either increment or decrement.
          onPressed: controller.changeCount,
          child: Icon(Icons.change_circle),
        ),
      ),
    );
  }
}
