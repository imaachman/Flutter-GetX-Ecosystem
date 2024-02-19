import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final String setting;
  final Widget field;
  const SettingTile({super.key, required this.setting, required this.field});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          setting,
          style: const TextStyle(fontSize: 18),
        ),
        SizedBox(
          width: 100,
          child: field,
        ),
      ],
    );
  }
}
