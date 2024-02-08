import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:get/get.dart';

// import 'controller.dart';
// import 'count_text.dart';

void main() => runApp(const GetXDemo());

class GetXDemo extends StatelessWidget {
  const GetXDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      initialRoute: '/',
      unknownRoute: GetPage(name: '/notfound', page: () => Home()),
      getPages: [
        GetPage(name: '/home', page: () => Home()),
        GetPage(name: '/profile/', page: () => Second()),
        GetPage(
          name: '/profile/:user',
          page: () => Get.parameters['user'] == 'Aachman' ? Second() : Third(),
        ),
      ],
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // bool _canPop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bottomsheet Example')),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ]),
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       // ScaffoldMessenger.of(context).showSnackBar(
      //       //   SnackBar(
      //       //     content: Text('MESSAGE'),
      //       //     behavior: SnackBarBehavior.floating,
      //       //     dismissDirection: DismissDirection.horizontal,
      //       //     showCloseIcon: true,
      //       //   ),
      //       // );
      //       // Get.snackbar(
      //       //   'title',
      //       //   'message',
      //       //   snackPosition: SnackPosition.BOTTOM,
      //       //   borderRadius: 0,
      //       //   backgroundColor: Colors.black,
      //       //   colorText: Colors.amber,
      //       //   margin: EdgeInsets.zero,
      //       // );
      //       // Get.snackbar(
      //       //   'TITLE',
      //       //   'MESSAGE',
      //       //   snackPosition: SnackPosition.BOTTOM,
      //       //   duration: Duration(seconds: 10),
      //       //   backgroundColor: Colors.amber,
      //       //   barBlur: 2,
      //       // );
      //       Get.rawSnackbar(
      //         title: 'TITLE',
      //         message: 'MESSAGE',
      //       );
      //       // Get.toNamed('/profile?user=Aachman&author=yes');
      //     },
      //     child: Text('Navigate'),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add_alt_outlined),
        onPressed: () {
          // showCupertinoDialog(
          //   context: Get.overlayContext!,
          //   builder: (context) => AlertDialog(
          //     title: Text(
          //       'Terms and Conditions',
          //       style: TextStyle(fontStyle: FontStyle.italic),
          //     ),
          //     content:
          //         Text('Kindly accept these terms and conditions to proceed.'),
          //     actions: [
          //       ElevatedButton(
          //           onPressed: () => Get.back(), child: Text('Reject')),
          //       ElevatedButton(onPressed: () {}, child: Text('Accept')),
          //     ],
          //   ),
          // );
          // Get.generalDialog(
          //   pageBuilder: (context, animation, secondaryAnimation) =>
          //       Container(),
          //   transitionBuilder: (context, animation, secondaryAnimation, child) {
          //     return ScaleTransition(
          //       scale: Tween<double>(begin: 0, end: 1).animate(animation),
          //       child: AlertDialog(
          //         title: Text(
          //           'Terms and Conditions',
          //           style: TextStyle(fontStyle: FontStyle.italic),
          //         ),
          //         content: Text(
          //             'Kindly accept these terms and conditions to proceed.'),
          //         actions: [
          //           ElevatedButton(
          //               onPressed: () => Get.back(), child: Text('Reject')),
          //           ElevatedButton(onPressed: () {}, child: Text('Accept')),
          //         ],
          //       ),
          //     );
          //   },
          //   transitionDuration: Duration(milliseconds: 500),
          // );
          // Get.generalDialog(
          //     pageBuilder: (context, animation, secondaryAnimation) => Home());
          // Get.defaultDialog(
          //   title: 'Terms and Conditions',
          //   titleStyle: TextStyle(fontStyle: FontStyle.italic),
          //   middleText: 'Kindly accept these terms and conditions to proceed.',
          //   actions: [
          //     // ElevatedButton(onPressed: () {}, child: Text('PRESS')),
          //     // ElevatedButton(onPressed: () {}, child: Text('PRESS')),
          //     // ElevatedButton(onPressed: () {}, child: Text('PRESS')),
          //   ],
          //   textCancel: 'Reject',
          //   textConfirm: 'Accept',
          //   confirmTextColor: Colors.white,
          //   onConfirm: () {},
          //   onCancel: () {},
          //   radius: 10,
          //   // titlePadding: EdgeInsets.all(16),
          //   // contentPadding: EdgeInsets.all(16),
          //   // onWillPop: () async {
          //   //   if (_canPop) {
          //   //     return true;
          //   //   } else {
          //   //     showDialog(
          //   //       context: context,
          //   //       builder: (context) => AlertDialog(
          //   //         title: Text("Alert"),
          //   //         content: Text("Are you sure you want to exit?"),
          //   //         actions: [
          //   //           TextButton(
          //   //             onPressed: () {
          //   //               Navigator.of(context).pop();
          //   //             },
          //   //             child: Text("No"),
          //   //           ),
          //   //           TextButton(
          //   //             onPressed: () {
          //   //               setState(() {
          //   //                 _canPop = true;
          //   //               });
          //   //               Navigator.of(context).pop();
          //   //             },
          //   //             child: Text("Yes"),
          //   //           ),
          //   //         ],
          //   //       ),
          //   //     );
          //   //     return false;
          //   //   }
          //   // },
          //   // barrierDismissible: false,
          // );
          // Get.rawSnackbar(
          //   titleText: Text(
          //     'Error',
          //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          //   ),
          //   messageText: Text(
          //     'Cannot add item',
          //     style: TextStyle(fontSize: 14),
          //   ),
          //   snackPosition: SnackPosition.BOTTOM,
          //   duration: Duration(seconds: 3),
          //   backgroundColor: Colors.orange.shade300.withOpacity(1),
          //   barBlur: 5,
          //   margin: EdgeInsets.all(16),
          //   snackStyle: SnackStyle.FLOATING,
          //   forwardAnimationCurve: Curves.elasticOut,
          //   backgroundGradient:
          //       LinearGradient(colors: [Colors.orange, Colors.red]),
          //   borderRadius: 10,
          //   borderColor: Colors.black,
          //   borderWidth: 2,
          //   boxShadows: [
          //     BoxShadow(
          //       offset: Offset(0, 8),
          //     )
          //   ],
          // );
          // Get.rawSnackbar(
          //   title: 'TITLE',
          //   message: 'MESSAGE',
          // );
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://source.unsplash.com/150x150/?portrait'),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'UI/UX Designer | Flutter Enthusiast',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Add functionality for the first button (e.g., send message)
                            Navigator.pop(context);
                          },
                          child: Text('Send Message'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Add functionality for the second button (e.g., follow)
                            Navigator.pop(context);
                          },
                          child: Text('Follow'),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Add functionality for the third button (e.g., close)
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close, size: 16),
                      label: Text('Close'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second'),
      ),
      body: Center(
        child: Text(Get.parameters['user'] ?? 'NULL'),
      ),
    );
  }
}

class Third extends StatelessWidget {
  const Third({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third'),
      ),
      body: Center(
        child: Text(Get.parameters['user'] ?? 'NULL'),
      ),
    );
  }
}

// class Home extends StatelessWidget {
//   Controller ctrl() => Get.find<Controller>();

//   @override
//   Widget build(BuildContext context) {
//     Get.put<Controller>(Controller(0.obs));

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('GetxController Demo'),
//       ),
//       body: Stack(
//         children: [
//           Center(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 GetX<Controller>(
//                   // init: Controller(0.obs),
//                   // id: 'odd',
//                   // global: false,
//                   builder: (controller) {
//                     return CountText(
//                       count: controller.count.value.toString(),
//                       color: Colors.red,
//                     );
//                   },
//                 ),
//                 const SizedBox(width: 32),
//                 GetBuilder<Controller>(
//                   // id: 'even',
//                   builder: (controller) => CountText(
//                     count: controller.count.toString(),
//                     color: Colors.blue,
//                   ),
//                 ),
//                 const SizedBox(width: 32),
//                 Obx(() => CountText(
//                       count: ctrl().count.toString(),
//                       color: Colors.green,
//                     ))
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 16,
//             right: 180,
//             child: SizedBox(
//               width: 200,
//               child: TextField(
//                 controller: ctrl().textEditingController,
//                 decoration:
//                     const InputDecoration(hintText: 'Enter count value'),
//                 inputFormatters: [
//                   FilteringTextInputFormatter.allow(RegExp('[0-9]*')),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           FloatingActionButton(
//             onPressed: () async {
//               // Get.put<Controller>(Controller(5.obs));
//               // Get.lazyReplace<Controller>(() => Controller(5.obs));
//               // controller = Get.put(Controller(0.obs));
//               // Get.replace<Controller>(Controller2());
//               // Get.to(Home());
//               // String? data = await Get.toNamed<String>('/home', arguments: {'name': 'Aachman'});
//               // Get.back<String>(result: 'dark');
//               // Get.off(Home());
//               // Get.offNamed('/home');
//               // Get.offAndToNamed('/home');
//               // Get.until((route) => false);
//               // Get.offUntil(
//               //   GetPageRoute(page: () => SettingsPage()),
//               //   (route) => (route as GetPageRoute).routeName == '/home',
//               // );
//               // Get.offNamedUntil('/home', ModalRoute.withName('/home'));
//               // Get.offAll(Home());
//               // Get.offAllNamed('/home');
//               // Get.close(4);
//               // Get.back();
//               // var data = Get.arguments;
//               // print(data['name']);
//               // Navigator.pushNamed(context, routeName)
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //     builder: (context) => Home(),
//               //   ),
//               // );
//               // Navigator.of(context).push(
//               //   MaterialPageRoute(builder: (context) => Home()),
//               // );
//             },
//             child: const Icon(Icons.replay),
//           ),
//           SizedBox(width: 32),
//           FloatingActionButton(
//             onPressed: () => ctrl().incrementCount(),
//             child: const Icon(Icons.add),
//           ),
//         ],
//       ),
//     );
//   }
// }