import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter.dart';

/// A page that displays a text field to enter a name for the counter page and a
/// button to navigate to the counter page. It also displays the counter value
/// returned from the counter page.
class Home extends StatelessWidget {
  Home({super.key});

  // Initialize a text editing controller to retrieve the text field's value.
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Transfer Demo'),
      ),
      body: Center(
        child: ObxValue<RxnInt>(
          (count) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Enter a name for the counter page...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    // Navigate to the counter page while providing the page's
                    // name as an argument.
                    // Also expect the counter's value as the result when the
                    // counter page is popped.
                    count.value = await Get.to<int>(
                      () => Counter(),
                      arguments: textEditingController.text,
                    );
                  },
                  child: Text('Navigate to counter page'),
                ),
                SizedBox(height: 24),
                // Display the counter value returned from the counter page.
                Text('Count: ${count.value ?? 0}',
                    style: Get.textTheme.headlineLarge),
              ],
            );
          },
          RxnInt(),
        ),
      ),
    );
  }
}
