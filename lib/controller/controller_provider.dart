part of 'controller.dart';

class ControllerProvider<T extends Controller> extends StatefulWidget {
  const ControllerProvider({required this.create, required this.builder, super.key});

  /// The function that creates the controller
  /// typically you want to use dependency injection to provide the factory function for the controller
  final T Function() create;

  /// The builder function that will be called with the controller instance created inside of the state
  final Widget Function(T) builder;

  @override
  State<ControllerProvider> createState() => _ControllerProviderState<T>();
}

class _ControllerProviderState<T extends Controller> extends State<ControllerProvider<T>> {
  T? controller;

  @override
  void initState() {
    super.initState();
    controller = widget.create()..onInit();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!(controller?.isReady ?? true)) {
      controller?.inject(context, () {
        if (mounted) {
          setState(() {});
        }
      });
      controller?.onReady();
    }
  }

  @override
  void dispose() {
    controller?.onDispose();
    controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ControllerInheritedWidget<T>(
      controller: controller!,
      child: widget.builder(
        controller!,
      ),
    );
  }
}
