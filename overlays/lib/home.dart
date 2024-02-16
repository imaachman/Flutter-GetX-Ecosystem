import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottomsheet.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overlays Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              // Show a customized snackbar.
              onPressed: () => Get.rawSnackbar(
                titleText: Text(
                  'Error',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                messageText: Text(
                  'Cannot add item',
                  style: TextStyle(fontSize: 14),
                ),
                snackPosition: SnackPosition.BOTTOM,
                duration: Duration(seconds: 3),
                backgroundColor: Colors.orange.shade300.withOpacity(1),
                barBlur: 5,
                margin: EdgeInsets.all(16),
                snackStyle: SnackStyle.FLOATING,
                forwardAnimationCurve: Curves.elasticOut,
                backgroundGradient: LinearGradient(
                  colors: const [
                    Colors.orange,
                    Colors.red,
                  ],
                ),
                borderRadius: 10,
                borderColor: Colors.black,
                borderWidth: 2,
                boxShadows: [
                  BoxShadow(
                    offset: Offset(0, 8),
                  )
                ],
              ),
              child: Text('Show Snackbar'),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              // Show a customized dialog.
              onPressed: () => Get.generalDialog(
                // Builds the background of dialog.
                pageBuilder: (context, animation, secondaryAnimation) =>
                    Container(),

                // Builds the dialog and gives transition control.
                transitionBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return ScaleTransition(
                    scale: Tween<double>(begin: 0, end: 1)
                        .animate(animation), // use animation parameter
                    child: AlertDialog(
                      title: Text(
                        'Terms and Conditions',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      content: Text(
                          'Kindly accept these terms and conditions to proceed.'),
                      actions: [
                        ElevatedButton(
                          onPressed: () => Get.back(),
                          child: Text('Reject'),
                        ),
                        ElevatedButton(
                          onPressed: () => Get.back(),
                          child: Text('Accept'),
                        ),
                      ],
                    ),
                  );
                },

                // Duration of animation
                transitionDuration: Duration(milliseconds: 300),
              ),
              child: Text('Show Dialog'),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              // Show a customized bottom sheet.
              onPressed: () => Get.bottomSheet(
                CustomBottomSheet(),
                backgroundColor: Colors.white,
              ),
              child: Text('Show Bottom Sheet'),
            ),
          ],
        ),
      ),
    );
  }
}
