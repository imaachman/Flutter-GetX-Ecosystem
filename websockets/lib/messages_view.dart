import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

/// Widget to display the chat messages. It simulates a real chat application
/// by displaying messages on the left and right sides of the screen depending
/// on the message index.
class MessagesView extends StatelessWidget {
  final Controller controller;

  const MessagesView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: controller.messages.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              // Display odd messages on the right side to simulate messages
              // sent by the user.
              if (index.isOdd) const Spacer(),
              Container(
                // [context.widthTransformer] is an extension that divides the
                // screen width by the given value.
                width: context.widthTransformer(dividedBy: 2.5),
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                // Orange color is for the messages on the left (simulating
                // messages received from another user), and green color is for
                // the messages on the right (simulating messages sent by the
                // user).
                decoration: BoxDecoration(
                  color:
                      index.isEven ? Colors.orangeAccent : Colors.greenAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  // Display the chat message.
                  controller.messages[index],
                  style: Get.textTheme.labelSmall?.copyWith(fontSize: 24),
                ),
              ),
              // Display even messages on the left side to simulate messages
              // received from another user.
              if (index.isEven) const Spacer(),
            ],
          );
        },
      ),
    );
  }
}
