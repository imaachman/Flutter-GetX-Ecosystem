import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A switch widget with a label to its left.
class LabeledSwitch extends StatelessWidget {
  final String label;
  final bool value;
  final Function(bool) onChanged;

  const LabeledSwitch({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Get.theme.textTheme.labelLarge,
        ),
        Switch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
