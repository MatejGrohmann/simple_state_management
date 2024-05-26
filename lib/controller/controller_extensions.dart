part of 'controller.dart';

extension ControllerFinder on BuildContext {
  T getController<T extends Controller>() {
    return dependOnInheritedWidgetOfExactType<ControllerInheritedWidget<T>>()!.controller;
  }
}
