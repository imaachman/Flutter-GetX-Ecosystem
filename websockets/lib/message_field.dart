import 'package:flutter/material.dart';
import 'package:websockets/controller.dart';

/// Input field to send messages to the WebSocket server.
class MessageField extends StatelessWidget {
  final Controller controller;

  const MessageField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              // Bind the text field to the message controller.
              controller: controller.messageController,
              decoration: InputDecoration(
                hintText: 'Enter a message',
                suffix: IconButton(
                  icon: const Icon(Icons.send),
                  // Send the message to the WebSocket server.
                  onPressed: controller.sendMessage,
                ),
              ),
              // Send the message when the user presses the enter key.
              onSubmitted: (value) => controller.sendMessage(),
            ),
          ),
        ),
      ],
    );
  }
}
