import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controller class to manage the WebSocket connection and chat messages.
class Controller extends GetxController {
  /// [GetConnect] instance to create a WebSocket connection.
  final GetConnect connect = GetConnect();

  /// [TextEditingController] to access the text from the message input field.
  final TextEditingController messageController = TextEditingController();

  /// [GetSocket] instance to manage the WebSocket connection.
  late final GetSocket socket;

  /// Keeps track of the connection status.
  final RxBool isOnline = false.obs;

  /// A reactive list of chat messages. The chat UI updates when a new message
  /// is added to the list.
  final RxList messages = ['Hi, how are you?!'].obs;

  @override
  void onInit() async {
    // Define a WebSocket connection to the server.
    socket = connect.socket('https://echo.websocket.org/');

    // When the connection opens, mark the user as online.
    socket.onOpen(() => markUserOnline());

    // Listen for new messages and update the chat UI.
    socket.onMessage((message) => updateChatUI(newMessage: message));

    // Listen for nudges and notify the user.
    socket.on('nudge', (event) => notifyUser(event));

    // When the connection closes, mark the user as offline.
    socket.onClose((close) => markUserOffline());

    // Listen for errors and log them.
    socket.onError((error) => logError(error.message!));

    // Establish the WebSocket connection.
    socket.connect();

    super.onInit();
  }

  /// Mark the user as online.
  void markUserOnline() {
    // Update the connection status.
    isOnline.value = true;

    // Show a snackbar to notify the user that they are connected.
    Get.rawSnackbar(
      title: 'Connected',
      message: 'You are now connected to the server.',
      duration: const Duration(seconds: 2),
    );
  }

  /// Update the chat UI with a new message.
  void updateChatUI({required String newMessage}) {
    // Safety check for unwanted messages from server and user events.
    if (newMessage.startsWith('Request served by')) return;
    if (newMessage.startsWith('{"type":')) return;
    if (newMessage.isEmpty) return;

    // Add the new message to the [messages] list.
    messages.add(newMessage);
  }

  /// Notify the user of a nudge event.
  void notifyUser(String event) {
    Get.rawSnackbar(
      title: 'Notification',
      message: event,
      duration: const Duration(seconds: 2),
    );
  }

  /// Mark the user as offline.
  void markUserOffline() {
    // Update the connection status.
    isOnline.value = false;

    // Show a snackbar to notify the user that they are disconnected.
    Get.rawSnackbar(
      title: 'Disconnected',
      message: 'You are now disconnected from the server.',
      duration: const Duration(seconds: 2),
    );
  }

  /// Log an error message.
  void logError(String error) => log('Error: $error');

  /// Send a message to the server.
  void sendMessage() {
    // Get the message from the input field.
    final String message = messageController.text;
    if (message.isNotEmpty) {
      // Send the message to the server.
      socket.send(message);
      // Clear the input field.
      messageController.clear();
    }
  }

  /// Send a nudge event to the server.
  void nudgeUser() => socket.emit('nudge', 'Alexandra misses you!');
}
