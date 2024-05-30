import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import 'todos_model.dart';

/// The controller class responsible for fetching and maintaining the list of
/// todos. It allows CRUD operations of creating a new todo, updating its
/// status, and deleting it.
///
/// It extends [GetConnect] to make HTTP requests without having to instantiate
/// a separate [GetConnect] object. We can directly use the methods, such as
/// [get], [post], [put], and [delete], provided by [GetConnect]. This also lets
/// us configure more advanced settings, such as base URL, timeout, and request
/// modifiers, for all requests made by the controller.
class Controller extends GetConnect {
  /// Controller for todo's title input field. Used in the todo creation dialog.
  final TextEditingController titleController = TextEditingController();

  /// A map to store the list of todos fetched from the API.
  /// The key is the todo ID, and the value is the todo object.
  final RxMap<int, Todo> todos = <int, Todo>{}.obs;

  /// A boolean to indicate if the controller is saving a todo.
  /// Used to show a saving indicator in the app bar whenever a CRUD operation
  /// is in progress.
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

    // Add a request modifier to the http client.
    httpClient.addRequestModifier(_requestModifier);

    // Add a response modifier to the http client.
    httpClient.addResponseModifier(_responseModifier);

    // Fetch todos from the API.
    fetchTodos();

    super.onInit();
  }

  @override
  onClose() {
    // Remove the request and response modifiers when the controller is closed.
    httpClient.removeRequestModifier(_requestModifier);
    httpClient.removeResponseModifier(_responseModifier);

    // Dispose the title controller when the controller is closed.
    titleController.dispose();

    super.onClose();
  }

  /// Acts as a custom decoder depending on the request type.
  /// For GET requests, it decodes the response to a map of all todos.
  /// For POST requests, it decodes the response to a single todo.
  FutureOr<Request> _requestModifier(Request request) {
    // For GET requests, i.e., when fetching todos, decode the response to a map
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
    // For POST requests, i.e., when creating a new todo, decode the response to
    // a single todo.
    else if (request.method == 'post') {
      return request.copyWith(
          decoder: (createdTodoMap) => Todo.fromJson(createdTodoMap));
    } else {
      return request;
    }
  }

  /// Capitalizes the title of the todo when creating a new one.
  FutureOr _responseModifier(Request request, Response response) {
    // For POST requests, i.e., when creating a new todo, capitalize the title.
    if (request.method == 'post') {
      // Modifier is called after decoding the response body, so we can directly
      // assume the body to be a Todo object.
      // We can simply use the `capitalize` extension from GetX to capitalize
      // the title.
      (response.body as Todo).title = (response.body as Todo).title.capitalize!;
    }

    return response;
  }

  /// GET request to fetch todos.
  Future<void> fetchTodos() async {
    // Fetch todos from the API.
    // We don't need to provide the full URL here since we have already set the
    // base URL in the controller.
    final Response response = await get('/todos');

    // Populate the todos map with the fetched data.
    // [response.body] has already been decoded to a map of todos via the
    // request modifier, so we can directly use it.
    todos.assignAll(response.body);
  }

  /// POST request to create a new todo.
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
    // We don't need to provide the full URL here since we have already set the
    // base URL in the controller.
    final Response response = await post(
      '/todos',
      todo.toJson(),
    );

    // Add the new todo to the local todos map.
    // [response.body] has already been decoded to a [Todo] object via the
    // request modifier, so we can directly use it.
    final Todo newTodo = response.body;

    // Add the new todo to the local todos map.
    todos[newTodo.id] = newTodo;

    // Clear the title input.
    titleController.clear();

    // Set the saving state to false.
    saving.value = false;
  }

  /// PUT request to update todo status.
  Future<void> updateTodoStatus(Todo todo, bool status) async {
    // Set the saving state to true.
    saving.value = true;

    // Update the todo status.
    todo.completed = status;

    // Send the updated todo to the server.
    // We don't need to provide the full URL here since we have already set the
    // base URL in the controller.
    final Response response = await put(
      '/todos/${todo.id}',
      todo.toJson(),
    );

    // If the server request is successful.
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

  /// DELETE request to delete a todo.
  Future<void> deleteTodo(Todo todo) async {
    // Set the saving state to true.
    saving.value = true;

    // Send the delete request to the server.
    // We don't need to provide the full URL here since we have already set the
    // base URL in the controller.
    await delete('/todos/${todo.id}');

    // Remove the deleted todo from the local todos map.
    todos.remove(todo.id);

    // Set the saving state to false.
    saving.value = false;
  }
}
