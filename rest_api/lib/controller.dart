import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/todos_model.dart';

class Controller extends GetxController {
  final GetConnect connect = GetConnect();

  final TextEditingController titleController = TextEditingController();

  final RxMap<int, Todo> todos = <int, Todo>{}.obs;

  final RxBool saving = false.obs;

  @override
  void onInit() {
    fetchTodos();
    super.onInit();
  }

  @override
  onClose() {
    titleController.dispose();
    super.onClose();
  }

  // GET request to fetch todos.
  Future<void> fetchTodos() async {
    // Fetch todos from the API.
    final Response response =
        await connect.get('https://jsonplaceholder.typicode.com/todos');
    final List data = response.body;

    // Populate the todos map with the fetched data.
    for (final item in data) {
      final Todo todo = Todo.fromJson(item);
      todos[todo.id] = todo;
    }
  }

  // POST request to create a new todo.
  Future<void> createTodo() async {
    // Set the saving state to true.
    saving.value = true;

    // Create a new todo from the title input.
    final Todo todo = Todo(
      userId: 1,
      id: todos.length + 1,
      title: titleController.text,
      completed: false,
    );

    // Send the new todo to the server.
    final Response response = await connect.post(
      'https://jsonplaceholder.typicode.com/todos',
      todo.toJson(),
      // We can decode the response body to a Todo object directly by providing
      // a custom decoder function.
      decoder: (body) => Todo.fromJson(body),
    );

    // Add the new todo to the local todos map.
    // By default, the response body is decoded to a Map<String, dynamic>.
    // But since we provided a custom decoder function, the response body is
    // decoded to a Todo object.
    final Todo newTodo = response.body;
    todos[newTodo.id] = newTodo;

    // Clear the title input.
    titleController.clear();

    // Set the saving state to false.
    saving.value = false;
  }

  // PUT request to update todo status.
  Future<void> updateTodoStatus(Todo todo, bool status) async {
    // Set the saving state to true.
    saving.value = true;

    // Update the todo status.
    todo.completed = status;

    // Send the updated todo to the server.
    final Response response = await connect.put(
      'https://jsonplaceholder.typicode.com/todos/${todo.id}',
      todo.toJson(),
    );

    if (response.statusCode == 200) {
      // Update the local todos map with the updated todo.
      final Todo updatedTodo = Todo.fromJson(response.body);
      todos[updatedTodo.id] = updatedTodo;
    } else {
      // Update the status locally even if the server request fails.
      todos[todo.id] = todo;
    }

    // Set the saving state to false.
    saving.value = false;
  }

  // DELETE request to delete a todo.
  Future<void> deleteTodo(Todo todo) async {
    // Set the saving state to true.
    saving.value = true;

    // Send the delete request to the server.
    await connect
        .delete('https://jsonplaceholder.typicode.com/todos/${todo.id}');

    // Remove the deleted todo from the local todos map.
    todos.remove(todo.id);

    // Set the saving state to false.
    saving.value = false;
  }
}
