import 'package:flutter/material.dart';
import 'package:simple_state_management/simple_state_management.dart';

class CounterController extends StateController {
  final count = 0.asStream;

  increment() => count.value++;

  decrement() => count.value--;

  reset() {
    count.value = 0;
    showSnackBar(const SnackBar(content: Text('Counter was reset!')));
  }

  @override
  void onDispose() {
    count.dispose();
    super.onDispose();
  }
}
