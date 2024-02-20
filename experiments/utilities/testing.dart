import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

class CounterController extends GetxController {
  final counter = 0.obs;

  @override
  void onInit() {
    super.onInit();
    counter.value = 1;
  }

  @override
  void onClose() {
    counter.value = -1;
    super.onClose();
  }

  void increment() => counter.value++;

  void decrement() => counter.value--;
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Text(
            counterController.counter.toString(),
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterController.increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}
