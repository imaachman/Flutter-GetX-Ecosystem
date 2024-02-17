import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websockets/connection_switch.dart';
import 'package:websockets/message_field.dart';
import 'package:websockets/messages_view.dart';

import 'controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebSockets Demo'),
        actions: [
          IconButton(
            onPressed: controller.nudgeUser,
            icon: const Icon(Icons.filter_vintage_rounded),
          ),
          ConnectionSwitch(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Flexible(child: MessagesView(controller: controller)),
            MessageField(controller: controller),
          ],
        ),
      ),
    );
  }
}
