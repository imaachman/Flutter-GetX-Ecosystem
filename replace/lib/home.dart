import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

/// Home page of the app with a switch to replace the controller.
/// With the switch, the controller can be replaced with either
/// [IncrementController] or [DecrementController]. Then, the user can
/// navigate to the counter page to see the effect of the controller.
/// Depending on the selection, the counter will either increment or decrement.
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get.replace Demo'),
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
                      // Replace controller based on the switch value.
                      // If the switch is on, replace the controller with
                      // [DecrementController]. Otherwise, replace it with
                      // [IncrementController].
                      Get.replace<BaseController>(
                        value ? DecrementController() : IncrementController(),
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
                // Navigate to the counter page.
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
