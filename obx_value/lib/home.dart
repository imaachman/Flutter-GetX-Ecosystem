import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ObxValue Demo'),
      ),
      body: Center(
        child: ObxValue<RxBool>(
          (data) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                value: data.value,
                onChanged: (value) {
                  data.value = value;
                  Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
                },
              ),
            ],
          ),
          false.obs,
        ),
      ),
    );
  }
}
