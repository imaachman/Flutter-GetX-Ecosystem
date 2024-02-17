import 'package:flutter/material.dart';

import 'controller.dart';

class TodosList extends StatelessWidget {
  final Controller controller;

  const TodosList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: controller.todos.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final todo = controller.todos.values.toList()[index];
        return ListTile(
          title: Text(todo.title),
          leading: Text('${index + 1}'),
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
