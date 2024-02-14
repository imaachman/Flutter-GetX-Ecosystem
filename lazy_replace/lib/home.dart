import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get.lazyReplace Demo'),
      ),
      body: Center(
        child: ObxValue<RxBool>(
          (data) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Increment',
                    style: Get.theme.textTheme.titleLarge,
                  ),
                  SizedBox(width: 16),
                  Switch(
                    value: data.value,
                    onChanged: (value) {
                      data.value = value;
                      // Lazily replace controller based on the switch value.
                      Get.lazyReplace<BaseController>(
                        () => value
                            ? DecrementController()
                            : IncrementController(),
                      );
                    },
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Decrement',
                    style: Get.theme.textTheme.titleLarge,
                  ),
                ],
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Get.toNamed('/counter'),
                child: Text('Navigate to counter page'),
              ),
            ],
          ),
          false.obs,
        ),
      ),
    );
  }
}
