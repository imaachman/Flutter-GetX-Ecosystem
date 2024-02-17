import 'package:flutter/material.dart';
import 'package:websockets/controller.dart';

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
              controller: controller.messageController,
              decoration: InputDecoration(
                hintText: 'Enter a message',
                suffix: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: controller.sendMessage,
                ),
              ),
              onSubmitted: (value) => controller.sendMessage(),
            ),
          ),
        ),
      ],
    );
  }
}
