import 'package:flutter/material.dart';

/// Widget to display the count value with the specified color.
class CountText extends StatelessWidget {
  final String count;
  final Color color;

  const CountText({Key? key, required this.count, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      count,
      style: TextStyle(
        fontSize: 56,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
