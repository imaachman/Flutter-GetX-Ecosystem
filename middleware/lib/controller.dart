import 'package:get/get.dart';

/// Controller responsible for holding the state of the various user settings.
/// It is accessed by the [Middleware] class to determine the user's settings
/// and perform actions accordingly.
class Controller extends GetxController {
  /// The user's name.
  final RxString userName = ''.obs;

  /// Whether the user is logged in.
  final RxBool isLoggedIn = true.obs;

  /// Whether the user has admin access.
  final RxBool allowAdminAccess = false.obs;

  /// Whether to set dark mode.
  final RxBool setDarkMode = false.obs;

  /// Whether to show ads.
  final RxBool showAds = false.obs;

  /// Whether to disconnect the user.
  final RxBool disconnect = false.obs;
}

/// A mock controller that acts as an admin controller. If the user has admin
/// access, this controller is initialized by the [Middleware] class.
class AdminController extends GetxController {}
