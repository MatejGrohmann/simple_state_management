part of 'controller.dart';

class ControllerInheritedWidget<T extends Controller> extends InheritedWidget {
  const ControllerInheritedWidget({
    required this.controller,
    required super.child,
    super.key,
  });

  final T controller;

  @override
  bool updateShouldNotify(ControllerInheritedWidget oldWidget) {
    return controller != oldWidget.controller;
  }
}