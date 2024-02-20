import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/todos_list.dart';

import 'controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('REST API Demo (TODOs App)'),
          actions: [
            if (controller.saving.value)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Saving...',
                    style:
                        Get.textTheme.labelLarge?.copyWith(color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
        body: Center(
          child: SizedBox(
            width: context.widthTransformer(dividedBy: 1.5),
            child: controller.todos.isEmpty
                ? const CupertinoActivityIndicator()
                : TodosList(controller: controller),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.defaultDialog(
            titlePadding: EdgeInsets.fromLTRB(16, 16, 16, 0),
            contentPadding: EdgeInsets.all(16),
            title: 'Add Todo',
            content: TextField(
              controller: controller.titleController,
              decoration: const InputDecoration(
                labelText: 'Todo',
                border: OutlineInputBorder(),
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Get.back(),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.createTodo();
                  Get.back();
                },
                child: const Text('Add'),
              ),
            ],
          ),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
