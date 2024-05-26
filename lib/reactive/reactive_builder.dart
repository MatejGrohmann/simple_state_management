part of 'reactive.dart';

class ReactiveBuilder extends StatefulWidget {
  const ReactiveBuilder({
    required this.builder,
    super.key,
  });

  final WidgetBuilder builder;

  @override
  State<ReactiveBuilder> createState() => _ReactiveBuilderState();
}

class _ReactiveBuilderState extends State<ReactiveBuilder> implements ReactiveListenerInterface {
  @override
  bool get canUpdate => mounted;

  @override
  bool canRegister = true;

  @override
  void onUpdate() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ReactiveListenerInterface.proxy = this;
    final child = widget.builder(context);
    canRegister = false;
    return child;
  }
}
