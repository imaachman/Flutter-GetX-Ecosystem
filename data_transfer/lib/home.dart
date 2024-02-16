import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obx_value/counter.dart';

class Home extends StatelessWidget {
  Home({super.key});

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
