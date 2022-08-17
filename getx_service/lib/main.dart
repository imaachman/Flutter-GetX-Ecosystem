import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'service.dart';
import 'settings_bottomsheet.dart';

void main() async {
  await Get.putAsync<Service>(() => Service().initStorage());
  // Get.put(Service());
  runApp(const GetxServiceDemo());
}

class GetxServiceDemo extends StatelessWidget {
  const GetxServiceDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetxService Demo'),
      ),
      body: Center(
        child: GetBuilder<Controller>(
            init: Controller(),
            builder: (controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(controller.name),
                  Text(controller.color),
                ],
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.bottomSheet(const SettingsBottomSheet()),
        child: const Icon(Icons.settings),
      ),
    );
  }
}
