import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A table cell that displays the text in the center with a border around it.
class TableBox extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const TableBox({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Center(
        child: Text(
          text,
          style: style ?? context.textTheme.labelSmall?.copyWith(fontSize: 16),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
