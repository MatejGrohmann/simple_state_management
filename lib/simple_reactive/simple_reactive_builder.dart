part of 'simple_reactive.dart';

class SimpleReactiveBuilder extends StatefulWidget {
  final WidgetBuilder builder;

  const SimpleReactiveBuilder({required this.builder, super.key});

  @override
  State<SimpleReactiveBuilder> createState() => _SimpleReactiveState();
}

class _SimpleReactiveState extends State<SimpleReactiveBuilder> {
  static _SimpleReactiveState? proxy;
  bool canRegister = true;

  @override
  Widget build(BuildContext context) {
    _SimpleReactiveState.proxy = this;
    final child = widget.builder(context);
    canRegister = false;
    return child;
  }

  bool get _canUpdate => mounted;

  _onUpdate() {
    if (_canUpdate) {
      setState(() {});
    }
  }
}
