import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'count_text.dart';

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
