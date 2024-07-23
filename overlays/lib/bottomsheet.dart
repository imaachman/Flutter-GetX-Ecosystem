import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Custom bottom sheet widget with user details and buttons to send message and
/// follow them.
class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1504257432389-52343af06ae3'),
          ),
          SizedBox(height: 16),
          Text(
            'John Doe',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'UI/UX Designer | Flutter Enthusiast',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => Get.back(),
                child: Text('Send Message'),
              ),
              ElevatedButton(
                onPressed: () => Get.back(),
                child: Text('Follow'),
              ),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () => Get.back(),
            icon: Icon(Icons.close, size: 16),
            label: Text('Close'),
          ),
        ],
      ),
    );
  }
}
