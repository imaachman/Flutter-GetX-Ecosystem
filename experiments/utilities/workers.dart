import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(WorkersApp());
}

class WorkersApp extends StatelessWidget {
  const WorkersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

class WorkerController extends GetxController {
  final RxInt count = 0.obs;

  late final Worker worker1;
  late final Worker worker2;
  late final Worker worker3;
  late final Worker worker4;
  late final Worker worker5;

  @override
  void onInit() {
    super.onInit();

    // worker1 = ever<int>(
    //   count,
    //   (value) => print('ever: $value'),
    //   condition: () => count.value > 5,
    //   // Cancel the worker when the stream is closed
    //   cancelOnError: true,
    //   // On stream error
    //   onError: () {},
    //   // On stream close
    //   onDone: () => print('done'),
    // );

    // worker2 = once(count, (value) => print('once: $value'));

    // worker3 = debounce(
    //   count,
    //   (value) => print('debounce: $value'),
    //   time: Duration(seconds: 1),
    // );

    worker4 = interval(count, (value) => print('interval: $value'),
        time: Duration(seconds: 1));

    // worker5 = everAll([count], (callback) => print('everAll: $callback'));
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final WorkerController workerController = Get.put(WorkerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Center(
        child: Obx(
          () => Text(
            workerController.count.value.toString(),
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          workerController.count.value++;
          if (workerController.count.value == 5) {
            workerController.count.close();
            workerController.worker1.dispose();
          }
          // if (workerController.count.value == 6) {
          //   workerController.worker2.dispose();
          // }
          // if (workerController.count.value == 7) {
          //   workerController.worker3.dispose();
          // }
          // if (workerController.count.value == 8) {
          //   workerController.worker4.dispose();
          // }
          // if (workerController.count.value == 9) {
          //   workerController.worker5.dispose();
          // }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
