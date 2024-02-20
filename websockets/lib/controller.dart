import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  final GetConnect connect = GetConnect();

  final TextEditingController messageController = TextEditingController();

  late final GetSocket socket;

  final RxBool isOnline = false.obs;

  final RxList messages = ['Hi, how are you?!'].obs;

  @override
  void onInit() async {
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

    // Connect to the server.
    socket.connect();

    super.onInit();
  }

  /// Mark the user as online.
  void markUserOnline() {
    isOnline.value = true;
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
    isOnline.value = false;
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
    final message = messageController.text;
    if (message.isNotEmpty) {
      socket.send(message);
      messageController.clear();
    }
  }

  /// Send a nudge event to the server.
  void nudgeUser() => socket.emit('nudge', 'Alexandra misses you!');
}
