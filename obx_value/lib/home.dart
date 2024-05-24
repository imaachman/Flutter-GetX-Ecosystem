import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Widget that toggles the theme mode between light and dark and displays a
/// message based on the current value of the switch.
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ObxValue Demo'),
      ),
      body: Center(
        // ObxValue is a widget that listens to an Rx value and rebuilds the
        // wrapped widget when the value changes.
        child: ObxValue<RxBool>(
          // [data] is the latest value after state change.
          (data) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Display a message based on the current value of the switch.
              Text(
                data.value
                    ? 'It\'s dark in here...'
                    : 'Too bright! too bright!',
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 48),
              Switch(
                // The value of the switch is bound to the Rx value.
                value: data.value,
                // When the switch is toggled, update the Rx value and toggle
                // the theme mode.
                onChanged: (value) {
                  data.value = value;
                  Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
                },
              ),
            ],
          ),
          // The initial value provided to the switch.
          false.obs,
        ),
      ),
    );
  }
}
