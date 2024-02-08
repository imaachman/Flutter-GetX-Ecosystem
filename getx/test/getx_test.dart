import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:getx/utilities/testing.dart';

void main() {
  group('Unit Test CounterController', () {
    CounterController counterController = CounterController();
    test('Initial value should be 0', () {
      expect(counterController.counter.value, 0);
    });
    test('Injecting controller using GetX should set the value to 1', () {
      counterController = Get.put(CounterController());
      expect(counterController.counter.value, 1);
    });
    test('Increment should increase the value by 2', () {
      counterController.increment();
      expect(counterController.counter.value, 2);
    });
    test('Decrement should decrease the value by 1', () {
      counterController.decrement();
      expect(counterController.counter.value, 1);
    });
    test('Deleting the controller should set the value to -1', () {
      Get.delete<CounterController>();
      expect(counterController.counter.value, -1);
    });
  });

  group('Widget Test Counter App', () {
    testWidgets('Counter should increment by 1', (WidgetTester tester) async {
      // Build app and trigger a frame.
      await tester.pumpWidget(const CounterApp());

      // Verify that the counter is showing 1.
      expect(find.text('1'), findsOneWidget);
      expect(find.text('2'), findsNothing);

      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify that the app has navigated to Settings Page.
      expect(find.text('1'), findsNothing);
      expect(find.text('2'), findsOneWidget);
    });
  });
}
