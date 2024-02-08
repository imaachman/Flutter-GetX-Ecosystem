import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MiddlewareTestApp());

class TestMiddleware extends GetMiddleware {
  TestMiddleware({super.priority});

  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    print('REDIRECT DELEGATE');
    // if (route.uri == Uri.parse('/second')) {
    //   return GetNavConfig.fromRoute('/second/third');
    // }
    // if (route.uri == Uri.parse('/home')) {
    //   return GetNavConfig.fromRoute('/second');
    // }
    return super.redirectDelegate(route);
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    print('ON PAGE CALLED');
    if (page?.name == '/second') {
      return page?.copy(
        name: '/fourth',
        arguments: {'name': 'Aachman'},
      );
    }
    return super.onPageCalled(page);
  }

  @override
  RouteSettings? redirect(String? route) {
    print('REDIRECT');
    // if (route == '/second') return RouteSettings(name: '/second/third');
    return super.redirect(route);
  }

  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    print('ON BINDINGS START');
    // if (allowAdminAccess) {
    //   bindings?.add(BindingsBuilder(() {
    //     Get.put(AdminController());
    //   }));
    // }
    return bindings;
  }

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    print('ON PAGE BUILD START');
    return super.onPageBuildStart(page);
  }

  @override
  Widget onPageBuilt(Widget page) {
    print('ON PAGE BUILT');
    // return Placeholder();
    return super.onPageBuilt(page);
  }

  @override
  void onPageDispose() {
    print('ON PAGE DISPOSE');
    super.onPageDispose();
  }
}

class MiddlewareTestApp extends StatelessWidget {
  const MiddlewareTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      // initialRoute: '/home',
      getPages: [
        GetPage(
          name: '/home',
          page: () => Home(),
        ),
        GetPage(
          name: '/second',
          page: () => Second(),
          middlewares: [TestMiddleware()],
          children: [
            GetPage(
              name: '/third',
              page: () => Third(),
            ),
          ],
        ),
        GetPage(
          name: '/fourth',
          page: () => Fourth(),
        ),
      ],
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => Get.rootDelegate.offNamed('/second'),
          child: Text('Go to second'),
        ),
      ),
    );
  }
}

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => Get.back(),
          child: Text('Go back to home'),
        ),
      ),
    );
  }
}

class Third extends StatelessWidget {
  const Third({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => Get.back(),
          child: Text('Go back to second'),
        ),
      ),
    );
  }
}

class Fourth extends StatelessWidget {
  const Fourth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => Get.back(),
          child: Text('Go back to third'),
        ),
      ),
    );
  }
}
