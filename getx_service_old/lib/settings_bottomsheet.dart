import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_service/setting_tile.dart';

import 'controller.dart';

class SettingsBottomSheet extends StatelessWidget {
  const SettingsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Settings',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const SizedBox(height: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GetBuilder<Controller>(
                  builder: (controller) => SettingTile(
                    setting: 'Name',
                    field: TextField(
                      controller: TextEditingController(text: controller.name),
                      decoration: const InputDecoration(hintText: 'Enter name'),
                      onSubmitted: controller.changeName,
                    ),
                  ),
                ),
                SettingTile(
                  setting: 'Color',
                  field: DropdownButton<String>(
                    value: 'Red',
                    items: const [
                      DropdownMenuItem<String>(
                        child: Text('Red'),
                        value: 'Red',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('Green'),
                        value: 'Green',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('Blue'),
                        value: 'Blue',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('Yellow'),
                        value: 'Yellow',
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
