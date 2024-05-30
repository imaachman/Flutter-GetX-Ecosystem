import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

/// Switch to connect/disconnect the WebSocket.
class ConnectionSwitch extends StatelessWidget {
  ConnectionSwitch({super.key});

  final Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Switch(
        // Set the thumb color based on the connection status.
        // Green for online and red for offline.
        thumbColor: WidgetStateColor.resolveWith(
          (states) => controller.isOnline.value ? Colors.green : Colors.red,
        ),
        // Set the track color based on the connection status.
        // Light green for online and light red for offline.
        trackColor: WidgetStateColor.resolveWith(
          (states) => controller.isOnline.value
              ? Colors.green.shade200
              : Colors.red.shade200,
        ),
        // Set the value based on the connection status.
        value: controller.isOnline.value,
        // Switch the connection on or off.
        onChanged: (value) {
          if (value) {
            controller.socket.connect();
          } else {
            // Status code must be 1000 when the platform is web.
            controller.socket.close(1000);
          }
        },
      ),
    );
  }
}
