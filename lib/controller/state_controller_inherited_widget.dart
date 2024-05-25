part of 'state_controller.dart';

class StateControllerInheritedWidget<T extends StateController> extends InheritedWidget {
  const StateControllerInheritedWidget({
    required this.controller,
    required super.child,
    super.key,
  });

  final T controller;

  @override
  bool updateShouldNotify(StateControllerInheritedWidget oldWidget) {
    return controller != oldWidget.controller;
  }
}