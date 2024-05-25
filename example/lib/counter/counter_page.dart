import 'package:flutter/material.dart';
import 'package:simple_state_management/controller/state_controller.dart';
import 'package:simple_state_management/simple_reactive/simple_reactive.dart';

import 'counter_controller.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StateControllerProvider<CounterController>(
      create: () => CounterController(),
      builder: (controller) => Scaffold(
        key: controller.scaffoldKey,
        appBar: AppBar(
          title: const Text('Counter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              SimpleReactiveBuilder(builder: (context) {
                final count = controller.count.value;
                return Text(
                  '$count',
                  style: Theme.of(context).textTheme.displayLarge,
                );
              }),
            ],
          ),
        ),
        floatingActionButton: const CounterButtonBar(),
      ),
    );
  }
}

class CounterButtonBar extends StateControllerView<CounterController> {
  const CounterButtonBar({super.key});

  @override
  Widget build(BuildContext context, controller) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: controller.increment,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          onPressed: controller.decrement,
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          onPressed: controller.reset,
          tooltip: 'Reset',
          child: const Icon(Icons.refresh),
        ),
      ],
    );
  }
}
