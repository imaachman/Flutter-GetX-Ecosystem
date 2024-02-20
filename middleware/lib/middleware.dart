import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class Middleware extends GetMiddleware {
  // Uncomment the following code while using Navigator 2.0.
  // @override
  // Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
  //   final Controller controller = Get.find();
  //
  //   // If user is not logged in, redirect to login page.
  //   if (!controller.isLoggedIn.value) {
  //     return GetNavConfig.fromRoute('/login');
  //   }
  //
  //   return super.redirectDelegate(route);
  // }

  @override
  GetPage? onPageCalled(GetPage? page) {
    final Controller controller = Get.find();

    // If user's name is present, pass it as an argument.
    if (controller.userName.isNotEmpty) {
      return page?.copy(
        arguments: controller.userName,
      );
    }

    return super.onPageCalled(page);
  }

  @override
  RouteSettings? redirect(String? route) {
    final Controller controller = Get.find();

    // If user is not logged in, redirect to login page.
    if (!controller.isLoggedIn.value) {
      return const RouteSettings(name: '/login');
    }

    return super.redirect(route);
  }

  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    final Controller controller = Get.find();

    // If user has admin access, add AdminController to the list of bindings.
    if (controller.allowAdminAccess.value && bindings != null) {
      // Create a new binding that initializes AdminController.
      final Bindings adminBinding = BindingsBuilder(() {
        Get.put<AdminController>(AdminController());
      });
      // Add the new binding to the list of bindings.
      bindings.add(adminBinding);
    }

    return super.onBindingsStart(bindings);
  }

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    final Controller controller = Get.find();

    if (controller.setDarkMode.value) {
      // Once the page is rendered, change the theme mode to dark.
      Get.engine.addPostFrameCallback((timeStamp) {
        Get.changeThemeMode(ThemeMode.dark);
      });
    }

    return super.onPageBuildStart(page);
  }

  @override
  Widget onPageBuilt(Widget page) {
    final Controller controller = Get.find();

    if (controller.showAds.value) {
      // Once the page is rendered, show an advertisement dialog.
      Get.engine.addPostFrameCallback((timeStamp) {
        Get.dialog(
          AlertDialog(
            title: Text('Advertisement'),
            content: Text('Buy one get one free!'),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: Text('Close'),
              ),
            ],
          ),
        );
      });
    }

    return super.onPageBuilt(page);
  }

  @override
  void onPageDispose() {
    final Controller controller = Get.find();

    if (controller.disconnect.value) {
      // Once the page is disposed, close the socket connection.
      // For demonstration purposes, we are displaying a snackbar after a delay
      // of 500ms.
      Future.delayed(Duration(milliseconds: 500), () {
        Get.rawSnackbar(
          title: 'Socket Closed',
          message: 'Socket has been closed successfully!',
          duration: Duration(seconds: 2),
        );
      });
    }

    super.onPageDispose();
  }
}
