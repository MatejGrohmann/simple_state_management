part of 'controller.dart';

abstract class ControllerView<T extends Controller> extends StatefulWidget {
  const ControllerView({super.key});

  Widget build(BuildContext context, T controller);

  @override
  State<ControllerView<T>> createState() => _ControllerViewState<T>();
}

class _ControllerViewState<T extends Controller> extends State<ControllerView<T>> {
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
