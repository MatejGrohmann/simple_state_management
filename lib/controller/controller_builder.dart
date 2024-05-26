part of 'controller.dart';

class ControllerBuilder<T extends Controller> extends ControllerView<T> {
  const ControllerBuilder({required this.builder, super.key});

  final Widget Function(BuildContext context, T controller) builder;

  @override
  Widget build(BuildContext context, T controller) => builder(context, controller);
}
