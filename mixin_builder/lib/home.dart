import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'table_box.dart';

/// Home widget that displays a table with two rows. One for name and another
/// for age. The name can be entered in the text field and the age can be
/// incremented or decremented by pressing the floating action buttons.
class Home extends StatelessWidget {
  Home({super.key});

  // Inject the controller with [Get.put] method.
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MixinBuilder Demo'),
      ),
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: 400,
              // Use the MixinBuilder to listen to both manual and reactive
              // state changes.
              child: MixinBuilder<Controller>(
                builder: (controller) {
                  return Table(
                    children: [
                      TableRow(
                        children: [
                          const TableBox(text: 'Name'),
                          // Display name's value from the controller. It is a
                          // reactive variable, so it will automatically update
                          // when the value changes.
                          TableBox(text: controller.name.value),
                        ],
                      ),
                      TableRow(
                        children: [
                          const TableBox(text: 'Age'),
                          // Display age's value from the controller. It is a
                          // simple variable, so it update only in reaction to
                          // the [update] method call.
                          TableBox(text: controller.age.toString()),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 200,
            child: TextField(
              decoration: const InputDecoration(hintText: 'Enter name here!'),
              // Update the name value whenever the text field value changes.
              onChanged: controller.setName,
            ),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            // Decrement the age value when the button is pressed.
            onPressed: () => controller.decrementAge(),
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            // Increment the age value when the button is pressed.
            onPressed: () => controller.incrementAge(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
