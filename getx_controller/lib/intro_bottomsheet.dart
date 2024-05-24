import 'package:flutter/material.dart';

// Bottomsheet widget to display the welcome message when the app is launched.
class IntroBottomSheet extends StatelessWidget {
  const IntroBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      color: Colors.white,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to GetxController Demo',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Press button to increment count, or enter the value in text field.',
            style: TextStyle(fontSize: 32),
          ),
        ],
      ),
    );
  }
}
