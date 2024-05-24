import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:value_builder/input_text.dart';
import 'package:value_builder/input_text_field.dart';

/// Widget with a ValueBuilder that updates the InputText widget with the text
/// from the InputTextField widget.
class Home extends StatelessWidget {
  Home({super.key});

  /// The text controller for the text field.
  final TextEditingController textEditingController = TextEditingController();

  /// Callback function that is called when the text is updated.
  /// It shows a snackbar if the text length exceeds 20 characters.
  void onUpdate(String? value) {
    // Show a snackbar if the text length exceeds 20 characters and a snackbar
    // is not already open.
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
        // ValueBuilder widget that listens to changes in the text field and
        // updates the InputText widget.
        child: ValueBuilder<String?>(
          // Initial value of the text.
          initialValue: '',
          // Callback function that is called when the text is updated.
          onUpdate: onUpdate,
          // Callback function that is called when the widget is disposed.
          onDispose: textEditingController.dispose,
          // Builder function that returns the widget to be updated. [snapshot]
          // is the current value of the text. [updater] is the function that is
          // called to update the text.
          builder: (snapshot, updater) {
            return SizedBox(
              width: 200,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Display the latest text using [snapshot].
                  InputText(text: snapshot!),
                  SizedBox(height: 60),
                  // Update the text using the [updater] function.
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
