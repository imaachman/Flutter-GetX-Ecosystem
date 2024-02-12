import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:value_builder/input_text.dart';
import 'package:value_builder/input_text_field.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final TextEditingController textEditingController = TextEditingController();

  void onUpdate(String? value) {
    if (value!.length > 20 && !Get.isSnackbarOpen) {
      Get.rawSnackbar(
        title: 'Warning',
        message: 'Character limit exceeded',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueBuilder Demo'),
      ),
      body: Center(
        child: ValueBuilder<String?>(
          initialValue: '',
          onUpdate: onUpdate,
          onDispose: textEditingController.dispose,
          builder: (snapshot, updater) {
            return SizedBox(
              width: 200,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InputText(text: snapshot!),
                  SizedBox(height: 60),
                  InputTextField(
                    textEditingController: textEditingController,
                    onChanged: updater,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
