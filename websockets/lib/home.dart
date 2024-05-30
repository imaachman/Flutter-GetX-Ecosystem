import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websockets/connection_switch.dart';
import 'package:websockets/message_field.dart';
import 'package:websockets/messages_view.dart';

import 'controller.dart';

/// Home page of the application that displays the chat messages and the message
/// input field. The app bar contains a button to nudge the user and a switch
/// to connect/disconnect the WebSocket.
class Home extends StatelessWidget {
  Home({super.key});

  // Initialize the controller to manage the WebSocket connection and chat
  // messages.
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebSockets Demo'),
        actions: [
          IconButton(
            // Nudge the user by sending an event to the WebSocket server.
            onPressed: controller.nudgeUser,
            icon: const Icon(Icons.filter_vintage_rounded),
          ),
          // Switch to connect/disconnect the WebSocket.
          ConnectionSwitch(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Display the chat messages.
            Flexible(child: MessagesView(controller: controller)),
            // Input field to send messages to the WebSocket server.
            MessageField(controller: controller),
          ],
        ),
      ),
    );
  }
}
