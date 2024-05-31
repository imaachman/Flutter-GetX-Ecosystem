import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Widget that toggles the theme mode between light and dark and displays a
/// text stylized with the current text theme.
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theming Demo'),
      ),
      body: Center(
        child: Text('Welcome to my app!',
            style: TextStyle(
              // Retrieve the current text theme using [Get.theme].
              fontSize: Get.theme.textTheme.headlineLarge!.fontSize,
            )),
      ),
      floatingActionButton: FloatingActionButton(
        // Toggle the theme mode between light and dark.
        // [Get.isDarkMode] returns true if the current theme mode is dark.
        onPressed: () => Get.changeThemeMode(
            Get.isDarkMode ? ThemeMode.light : ThemeMode.dark),
        child: Icon(Icons.switch_left),
      ),
    );
  }
}
