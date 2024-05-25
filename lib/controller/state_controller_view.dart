part of 'state_controller.dart';

abstract class StateControllerView<T extends StateController> extends StatefulWidget {
  const StateControllerView({super.key});

  Widget build(BuildContext context, T controller);

  @override
  State<StateControllerView<T>> createState() => _StateControllerViewState<T>();
}

class _StateControllerViewState<T extends StateController> extends State<StateControllerView<T>> {
  T? controller;

  @override
  void didChangeDependencies() {
    controller = context.getController<T>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    assert(controller != null, 'Controller is null, did you forget to add StateControllerProvider?');
    return widget.build(context, controller!);
  }
}
