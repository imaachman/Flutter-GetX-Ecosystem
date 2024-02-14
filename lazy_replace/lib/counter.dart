import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obx_value/controller.dart';
import 'package:obx_value/count_text.dart';

class CounterPage extends StatelessWidget {
  CounterPage({super.key});

  final BaseController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Counter Page'),
        ),
        body: Center(
          child: CountText(
            count: controller.count.toString(),
            color: Colors.blue,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.changeCount,
          child: Icon(Icons.change_circle),
        ),
      ),
    );
  }
}
