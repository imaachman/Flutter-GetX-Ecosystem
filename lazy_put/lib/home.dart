import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'count_text.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Get.lazyPut Demo')),
      body: Center(
        child: Obx(
          () => CountText(
            count: Get.find<BaseController>().count.toString(),
            color: Colors.blue,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => Get.find<BaseController>().changeCount(),
        child: const Icon(Icons.change_circle),
      ),
    );
  }
}
