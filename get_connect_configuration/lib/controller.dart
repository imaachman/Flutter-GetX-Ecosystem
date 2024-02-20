import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import 'todos_model.dart';

class Controller extends GetConnect {
  final TextEditingController titleController = TextEditingController();

  final RxMap<int, Todo> todos = <int, Todo>{}.obs;

  final RxBool saving = false.obs;

  @override
  void onInit() {
    // Set the base URL for the API.
    baseUrl = 'https://jsonplaceholder.typicode.com';

    // Set the default content type for the API.
    defaultContentType = 'application/json; charset=utf-8';

    // Set the default user agent for the API.
    userAgent = 'MyCustomApp/1.0 (Android 11; SM-G991B Build/RP1A.200720.012)';
    sendUserAgent = true;

    // Don't allow redirects for the API.
    followRedirects = false;

    // Set the request timeout for the API.
    timeout = const Duration(seconds: 10);

    // Add a request modifier to the API.
    httpClient.addRequestModifier(_requestModifier);

    // Add a response modifier to the API.
    httpClient.addResponseModifier(_responseModifier);

    // Fetch todos from the API.
    fetchTodos();

    super.onInit();
  }

  @override
  onClose() {
    httpClient.removeRequestModifier(_requestModifier);
    httpClient.removeResponseModifier(_responseModifier);
    titleController.dispose();
    super.onClose();
  }

  // Acts as a custom decoder depending on the request type.
  FutureOr<Request> _requestModifier(Request request) {
    // For get requests, i.e., when fetching todos, decode the response to a map
    // of all todos.
    if (request.method == 'get') {
      return request.copyWith(
        decoder: (todosList) {
          final Map<int, Todo> todos = {
            for (final todoMap in todosList)
              todoMap['id']: Todo.fromJson(todoMap)
          };
          return todos;
        },
      );
    }
    // For post requests, i.e., when creating a new todo, decode the response to
    // a single todo.
    else if (request.method == 'post') {
      return request.copyWith(
          decoder: (createdTodoMap) => Todo.fromJson(createdTodoMap));
    } else {
      return request;
    }
  }

  // Capitalizes the title of the todo when creating a new one.
  FutureOr _responseModifier(Request request, Response response) {
    // For post requests, i.e., when creating a new todo, capitalize the title.
    if (request.method == 'post') {
      // Modifier is called after decoding the response body, so we can directly
      // assume the body to be a Todo object.
      (response.body as Todo).title = (response.body as Todo).title.capitalize!;
    }

    return response;
  }

  // GET request to fetch todos.
  Future<void> fetchTodos() async {
    // Fetch todos from the API.
    final Response response = await get('/todos');

    // Populate the todos map with the fetched data.
    // [response.body] has already been decoded to a map of todos via the
    // request modifier, so we can directly use it.
    todos.assignAll(response.body);
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
    final Response response = await post(
      '/todos',
      todo.toJson(),
    );

    // Add the new todo to the local todos map.
    // [response.body] has already been decoded to a Todo object via the
    // request modifier, so we can directly use it.
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
    final Response response = await put(
      '/todos/${todo.id}',
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
    await delete('/todos/${todo.id}');

    // Remove the deleted todo from the local todos map.
    todos.remove(todo.id);

    // Set the saving state to false.
    saving.value = false;
  }
}
