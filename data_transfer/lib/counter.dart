import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'count_text.dart';

/// A page that displays a counter and a button to increment it.
/// It retrieves the page's name from the arguments and displays it in the app
/// bar. In addition, it returns the counter value to the previous page when the
/// user taps the "Go back" button.
class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return ObxValue<RxInt>(
      (count) => Scaffold(
        appBar: AppBar(
          // Retrieve page's name from the arguments.
          title: Text('${Get.arguments} App'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CountText(
                count: count.toString(),
                color: Colors.blue,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                // Return to the previous page with the counter value as the
                // result.
                onPressed: () => Get.back<int>(result: count.value),
                child: Text('Go back'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => count.value++,
          child: Icon(Icons.add),
        ),
      ),
      0.obs,
    );
  }
}
