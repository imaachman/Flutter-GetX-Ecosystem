import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'intro_bottomsheet.dart';

class Controller extends GetxController {
  final TextEditingController textEditingController = TextEditingController();

  int count = 0;

  @override
  void onInit() {
    super.onInit();
    textEditingController.addListener(onTextChanged);
  }

  @override
  void onReady() {
    super.onReady();
    showIntroBottomSheet();
  }

  @override
  void onClose() {
    textEditingController.removeListener(onTextChanged);
    textEditingController.dispose();
    super.onClose();
  }

  void onTextChanged() {
    final String text = textEditingController.text;
    if (text.isEmpty) return;
    int value = int.parse(textEditingController.text);
    setCount(value);
  }

  void incrementCount() {
    count += 1;

    // If count is even, widgets with 'even' ID will update.
    // If it is odd, widgets with 'odd' ID will update.
    List<String> ids = count.isEven ? ['even'] : ['odd'];

    // Widgets will only update if count is less than 10 or greater than 15.
    bool condition = count < 10 || count > 15;

    update(ids, condition);

    textEditingController.text = count.toString();
  }

  void setCount(int value) {
    count = value;

    // If count is even, widgets with 'even' ID will update.
    // If it is odd, widgets with 'odd' ID will update.
    List<String> ids = count.isEven ? ['even'] : ['odd'];

    // Widgets will only update if count is less than 10 or greater than 15.
    bool condition = count < 10 || count > 15;

    update(ids, condition);
  }

  void showIntroBottomSheet() => Get.bottomSheet(const IntroBottomSheet());
}
