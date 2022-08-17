import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'count_text.dart';

void main() => runApp(const GetXDemo());

class GetXDemo extends StatelessWidget {
  const GetXDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetxController Demo'),
      ),
      body: Stack(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GetBuilder<Controller>(
                  init: Controller(),
                  id: 'odd',
                  global: false,
                  builder: (controller) {
                    return CountText(
                      count: controller.count.toString(),
                      color: Colors.red,
                    );
                  },
                ),
                const SizedBox(width: 32),
                GetBuilder<Controller>(
                  id: 'even',
                  builder: (controller) => CountText(
                    count: controller.count.toString(),
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 100,
            child: SizedBox(
              width: 200,
              child: TextField(
                controller: controller.textEditingController,
                decoration:
                    const InputDecoration(hintText: 'Enter count value'),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]*')),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.incrementCount,
        child: const Icon(Icons.add),
      ),
    );
  }
}
