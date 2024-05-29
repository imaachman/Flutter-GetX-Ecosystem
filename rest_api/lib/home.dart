import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/todos_list.dart';

import 'controller.dart';

/// The home screen of the app that displays a list of todos and allows the user
/// to add new todos.
class Home extends StatelessWidget {
  Home({super.key});

  // Initialize the controller to access the todos from the API.
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('REST API Demo (TODOs App)'),
          actions: [
            // Show a saving indicator when the controller is saving.
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
            // [context.widthTransformer] is a custom extension method that
            // divides the width of the screen by the given value.
            width: context.widthTransformer(dividedBy: 1.5),
            // Show a loading indicator while the todos are being fetched, and
            // then display the list of todos.
            child: controller.todos.isEmpty
                ? const CupertinoActivityIndicator()
                : TodosList(controller: controller),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // Show a dialog to add a new todo.
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
                  // Create a new todo when the user taps the 'Add' button.
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
