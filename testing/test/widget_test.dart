import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:testing/controller.dart';
import 'package:testing/main.dart';

void main() {
  /// Test group to test the logic of [CounterController] through unit tests.
  group('Unit Test CounterController', () {
    // Initialize controller conventionally.
    CounterController counterController = CounterController();

    test('Initial value should be 0', () {
      // [counter]'s value should be 0 in the beginning.
      expect(counterController.counter.value, 0);
    });

    test('Injecting controller using GetX should set the value to 1', () {
      // Initialize controller with [Get.put].
      counterController = Get.put(CounterController());

      // [counter]'s value should be set to 1.
      expect(counterController.counter.value, 1);
    });

    test('Increment should increase the value by 2', () {
      // Increment the value of counter.
      counterController.increment();

      // [counter]'s value should now be 2.
      expect(counterController.counter.value, 2);
    });

    test('Decrement should decrease the value by 1', () {
      // Decrement the value of counter.
      counterController.decrement();

      // [counter]'s value should now be 1.
      expect(counterController.counter.value, 1);
    });

    test('Deleting the controller should set the value to -1', () {
      // Delete the controller instance from memory.
      Get.delete<CounterController>();

      // [counter]'s value should now be set to -1.
      expect(counterController.counter.value, -1);
    });
  });

  /// Test the UI of the [HomePage] widget through widget tests.
  testWidgets('Counter should increment by 1', (WidgetTester tester) async {
    // Build app and trigger a frame.
    await tester.pumpWidget(const TestingDemo());

    // Verify that the counter is showing 1.
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the counter is showing 2.
    expect(find.text('1'), findsNothing);
    expect(find.text('2'), findsOneWidget);
  });
}
