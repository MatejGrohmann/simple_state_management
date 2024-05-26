import 'package:flutter/material.dart';
import 'package:simple_state_management/simple_state_management.dart';

class CounterController extends Controller {
  final count = 0.asStream;

  late ReactiveSubscriber<int> counterSubscriber;

  @override
  onReady() {
    counterSubscriber = ReactiveSubscriber(
      reactiveValue: count,
      onUpdate: (prev, current) {
        if (current == 0) {
          showSnackBar(const SnackBar(content: Text('Counter was reset!')));
          return;
        }

        if (current < 0 && prev >= 0) {
          showSnackBar(const SnackBar(content: Text('nagativni pico')));
        }
      },
    );

    super.onReady();
  }

  increment() => count.value++;

  decrement() => count.value--;

  reset() => count.value = 0;

  @override
  void onDispose() {
    counterSubscriber.dispose();
    count.dispose();
    super.onDispose();
  }
}
