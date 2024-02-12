import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'count_text.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<Controller>(
      init: Controller(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('GetX Widget Demo'),
          ),
          body: Stack(
            children: [
              Center(
                child: CountText(
                  count: controller.count.toString(),
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => controller.incrementCount(),
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
