part of 'state_controller.dart';

extension StateControllerContextFinder on BuildContext {
  T getController<T extends StateController>() {
    return dependOnInheritedWidgetOfExactType<StateControllerInheritedWidget<T>>()!.controller;
  }
}
