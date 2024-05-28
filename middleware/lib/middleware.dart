import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

/// Middleware class that intercepts the navigation flow and performs actions
/// at various stages of the navigation lifecycle.
class Middleware extends GetMiddleware {
  // Uncomment the following code while using Navigator 2.0.
  //
  // /// Redirects the user to the login page if they are not logged in.
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

  /// Fetches the user's name from the controller and passes it as an argument
  /// to the profile page.
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

  /// Redirects the user to the login page if they are not logged in.
  @override
  RouteSettings? redirect(String? route) {
    final Controller controller = Get.find();

    // If user is not logged in, redirect to login page.
    if (!controller.isLoggedIn.value) {
      return const RouteSettings(name: '/login');
    }

    return super.redirect(route);
  }

  /// Initializes the [AdminController] if the user has admin access.
  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    final Controller controller = Get.find();

    // If user has admin access, add [AdminController] to the list of bindings.
    if (controller.allowAdminAccess.value && bindings != null) {
      // Create a new binding that initializes [AdminController].
      final Bindings adminBinding = BindingsBuilder(() {
        Get.put<AdminController>(AdminController());
      });
      // Add the new binding to the list of bindings.
      bindings.add(adminBinding);
    }

    return super.onBindingsStart(bindings);
  }

  /// Changes the theme mode to dark if the user has set the dark mode.
  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    final Controller controller = Get.find();

    if (controller.setDarkMode.value) {
      // Once the page is rendered, change the theme mode to dark.
      // [Get.engine] is same as [WidgetsFlutterBinding.ensureInitialized()].
      Get.engine.addPostFrameCallback((timeStamp) {
        Get.changeThemeMode(ThemeMode.dark);
      });
    }

    return super.onPageBuildStart(page);
  }

  /// Shows an advertisement dialog once the page is rendered.
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

  /// Closes the socket connection once the page is disposed.
  @override
  void onPageDispose() {
    final Controller controller = Get.find();

    // If dark mode is set, change the theme mode to light to put the app back
    // to the default state.
    if (Get.isDarkMode) Get.changeThemeMode(ThemeMode.light);

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
