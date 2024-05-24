import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'intro_bottomsheet.dart';

// Controller class that manages the count value and updates the widgets.
class Controller extends GetxController {
  // [TextEditingController] instance to get the count value from the text
  // field.
  final TextEditingController textEditingController = TextEditingController();

  // Count value that will be displayed in the widgets.
  int count = 0;

  // Called as soon as the controller is initialized.
  @override
  void onInit() {
    super.onInit();

    // Add a listener to the textEditingController to listen to the text
    // changes.
    textEditingController.addListener(onTextChanged);
  }

  // Called after the widget is rendered on the screen.
  @override
  void onReady() {
    super.onReady();

    // Show the bottom sheet with the welcome message.
    showIntroBottomSheet();
  }

  // Called when the controller is removed from the memory.
  @override
  void onClose() {
    // Remove the listener from the textEditingController.
    textEditingController.removeListener(onTextChanged);

    // Dispose the textEditingController.
    textEditingController.dispose();

    super.onClose();
  }

  // Method that is called when the text changes in the text field.
  // It will parse the text to an integer and set the count value.
  void onTextChanged() {
    // Get the text from the textEditingController.
    final String text = textEditingController.text;

    // If the text is empty, return.
    if (text.isEmpty) return;

    // Parse the text to an integer.
    int value = int.parse(textEditingController.text);

    // Set the count value.
    setCount(value);
  }

  // Method to increment the count value.
  void incrementCount() {
    // Increment the count value.
    count += 1;

    // If count is even, widgets with 'even' ID will update.
    // If it is odd, widgets with 'odd' ID will update.
    List<String> ids = count.isEven ? ['even'] : ['odd'];

    // Widgets will only update if count is less than 10 or greater than 15.
    bool condition = count < 10 || count > 15;

    // Update the listener widgets.
    update(ids, condition);

    // Set the text in the text field to the new count value.
    textEditingController.text = count.toString();
  }

  // Method to set the count value.
  void setCount(int value) {
    // Set the count value.
    count = value;

    // If count is even, widgets with 'even' ID will update.
    // If it is odd, widgets with 'odd' ID will update.
    List<String> ids = count.isEven ? ['even'] : ['odd'];

    // Widgets will only update if count is less than 10 or greater than 15.
    bool condition = count < 10 || count > 15;

    // Update the listener widgets.
    update(ids, condition);
  }

  // Method to show the bottom sheet with the welcome message.
  void showIntroBottomSheet() => Get.bottomSheet(const IntroBottomSheet());
}
