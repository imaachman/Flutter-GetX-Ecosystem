import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ConnectionSwitch extends StatelessWidget {
  ConnectionSwitch({super.key});

  final Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Switch(
        // Set the thumb color based on the connection status.
        thumbColor: MaterialStateColor.resolveWith(
          (states) => controller.isOnline.value ? Colors.green : Colors.red,
        ),
        // Set the track color based on the connection status.
        trackColor: MaterialStateColor.resolveWith(
          (states) => controller.isOnline.value
              ? Colors.green.shade200
              : Colors.red.shade200,
        ),
        value: controller.isOnline.value,
        onChanged: (value) {
          // Switch the connection on or off.
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
