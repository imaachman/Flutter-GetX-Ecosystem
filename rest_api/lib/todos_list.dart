import 'package:flutter/material.dart';

import 'controller.dart';
import 'todos_model.dart';

/// Displays a list of all the todos with the ability to update their status and
/// delete them.
class TodosList extends StatelessWidget {
  // Take the controller as a parameter to access the todos.
  final Controller controller;

  const TodosList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: controller.todos.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        // Reverse the list to show the latest todo at the top.
        final List<Todo> todos =
            controller.todos.values.toList().reversed.toList();
        // Get the todo at the current index.
        final Todo todo = todos[index];
        return ListTile(
          title: Text(todo.title),
          leading: Text('${todos.length - index}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 8),

              // Update the status of the todo.
              Checkbox(
                value: todo.completed,
                onChanged: (value) => controller.updateTodoStatus(todo, value!),
              ),

              // Delete the todo.
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => controller.deleteTodo(todo),
              ),
            ],
          ),
        );
      },
    );
  }
}
