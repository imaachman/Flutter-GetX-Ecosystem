import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class MessagesView extends StatelessWidget {
  final Controller controller;

  const MessagesView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: controller.messages.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              if (index.isOdd) const Spacer(),
              Container(
                width: context.widthTransformer(dividedBy: 2.5),
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color:
                      index.isEven ? Colors.orangeAccent : Colors.greenAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  controller.messages[index],
                  style: Get.textTheme.labelSmall?.copyWith(fontSize: 24),
                ),
              ),
              if (index.isEven) const Spacer(),
            ],
          );
        },
      ),
    );
  }
}
